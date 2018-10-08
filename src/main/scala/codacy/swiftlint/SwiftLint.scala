package codacy.swiftlint

import java.nio.file.{Path, Paths}

import com.codacy.plugins.api.results.{Pattern, Result, Tool}
import com.codacy.plugins.api.{Options, Source}
import com.codacy.tools.scala.seed.utils.{CommandRunner, FileHelper}
import com.codacy.tools.scala.seed.utils.ToolHelper._
import play.api.libs.json._

import scala.util.{Failure, Properties, Success, Try}

case class SwiftLintFile(rule_id: String, file: String, reason: String, line: Int)

object SwiftLintFile {
  implicit val readsSwiftLintFile: Reads[SwiftLintFile] = new Reads[SwiftLintFile] {

    def reads(json: JsValue): JsResult[SwiftLintFile] = {
      for {
        rule_id <- (json \ "rule_id").validate[String]
        file <- (json \ "file").validate[String]
        reason <- (json \ "reason").validate[String]
        line <- (json \ "line").validate[Int]
      } yield SwiftLintFile(rule_id, file, reason, line)
    }
  }
}

object SwiftLint extends Tool {

  private lazy val nativeConfigFileNames = Set(".swiftlint.yml")

  override def apply(
    source: Source.Directory,
    configuration: Option[List[Pattern.Definition]],
    files: Option[Set[Source.File]],
    options: Map[Options.Key, Options.Value])(implicit specification: Tool.Specification): Try[List[Result]] = {
    Try {

      lazy val nativeConfig =
        FileHelper.findConfigurationFile(Paths.get(source.path), nativeConfigFileNames).map(_.toString)
      val filesToLint = files.fold(List(source.path.toString)) { paths =>
        paths.map(_.toString).toList
      }
      val patternsToLintOpt = configuration.withDefaultParameters

      val config = patternsToLintOpt.fold(Option.empty[String]) {
        case patternsToLint if patternsToLint.nonEmpty =>
          Some(writeConfigFile(patternsToLint).toString)
      }

      val cfgOpt = config.orElse(nativeConfig)

      val baseCmd = List("swiftlint", "lint", "--quiet", "--reporter", "json")

      val command: List[String] = cfgOpt match {
        case Some(opt) =>
          baseCmd ++ List("--config", opt, "--path") ++ filesToLint
        case None => baseCmd ++ List("--path") ++ filesToLint
      }

      CommandRunner.exec(command, Option(Paths.get(source.path).toFile)) match {
        case Right(resultFromTool) =>
          parseToolResult(resultFromTool.stdout) match {
            case s @ Success(_) => s
            case Failure(e) =>
              val msg =
                s"""
                   |${this.getClass.getSimpleName} exited with code ${resultFromTool.exitCode}
                   |command: ${command.mkString(" ")}
                   |message: ${e.getMessage}
                   |stdout: ${resultFromTool.stdout.mkString(Properties.lineSeparator)}
                   |stderr: ${resultFromTool.stderr.mkString(Properties.lineSeparator)}
                   |configFile:
                   |${cfgOpt.fold("")(p => scala.io.Source.fromFile(p).getLines().mkString("\n"))}
             """.stripMargin
              Failure(new Exception(msg))
          }
        case Left(e) =>
          Failure(e)
      }
    }.flatten
  }

  private def writeConfigFile(patternsToLint: List[Pattern.Definition]): Path = {
    val rules = patternsToLint.map(_.patternId.toString)
    val content =
      s"""whitelist_rules:
         |  - ${rules.mkString("\n  - ")}\n
      """.stripMargin

    FileHelper.createTmpFile(content, ".swiftlint-ci", ".yml")
  }

  private def parseToolResult(output: List[String]): Try[List[Result]] = {
    Try(Json.parse(output.mkString)).flatMap(parseToolResult)
  }

  private def parseToolResult(outputJson: JsValue): Try[List[Result]] = {
    /* Example:
     * [
     *   {
     *     "rule_id": "mark",
     *     "reason": "MARK comment should be in valid format. e.g. '\/\/ MARK: ...' or '\/\/ MARK: - ...'",
     *     "character": "5",
     *     "file": "\/Users\/marlontojal\/Documents\/GitHub\/codacy-swiftlint\/src\/main\/resources\/docs\/tests\/mark.swift",
     *     "severity": "Warning",
     *     "type": "Mark",
     *     "line": "3"
     *   },
     * ...
     * ]
     */

    Try(outputJson.as[List[SwiftLintFile]]).map { violations =>
      violations.flatMap { violation =>
        List(
          Result.Issue(
            Source.File(violation.file),
            Result.Message(violation.reason),
            Pattern.Id(violation.rule_id),
            Source.Line(violation.line)))
      }
    }
  }
}
