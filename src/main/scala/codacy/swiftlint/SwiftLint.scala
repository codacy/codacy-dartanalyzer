package codacy.swiftlint

import java.nio.file.{Path, Paths}

import com.codacy.plugins.api.results.{Pattern, Result, Tool}
import com.codacy.plugins.api.{ErrorMessage, Options, Source}
import com.codacy.tools.scala.seed.utils.{CommandRunner, FileHelper}
import com.codacy.tools.scala.seed.utils.ToolHelper._
import play.api.libs.json._
import better.files._
import com.codacy.plugins.api.results.Result.FileError

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

  def deleteNativeConfigurationFiles(source: Source.Directory): Unit = {
    File(source.path)
      .walk()
      .find(file => nativeConfigFileNames.contains(file.name))
      .foreach(_.delete())
  }

  def listOfFilesToLint(files: Option[Set[Source.File]], source: Source.Directory): List[String] = {
    val listOfFiles = files.fold(List(source.path.toString)) { paths =>
      paths.map(_.toString).toList
    }

    if (listOfFiles.isEmpty) {
      List(source.path)
    }

    listOfFiles
  }

  def nativeConfigurationFile(source: Source.Directory): Option[String] = {
    FileHelper.findConfigurationFile(Paths.get(source.path), nativeConfigFileNames).map(_.toString)
  }

  def configsFromCodacyConfiguration(
      configuration: Option[List[Pattern.Definition]]
  )(implicit specification: Tool.Specification): Option[String] = {
    val patternsToLintOpt = configuration.withDefaultParameters

    patternsToLintOpt.fold(Option.empty[String]) {
      case patternsToLint if patternsToLint.nonEmpty =>
        Some(writeConfigFile(patternsToLint).toString)
    }
  }

  def lintConfiguration(source: Source.Directory, configuration: Option[List[Pattern.Definition]])(
      implicit specification: Tool.Specification
  ): Option[String] = {
    lazy val nativeConfig = nativeConfigurationFile(source)

    val config = configsFromCodacyConfiguration(configuration)

    config.orElse(nativeConfig)
  }

  private def commandToRun(configOpt: Option[String], file: String): List[String] = {
    val baseCmd = List("swiftlint", "lint", "--quiet", "--reporter", "json")

    val configCmd = configOpt match {
      case Some(opt) =>
        baseCmd ++ List("--config", opt)
      case None => baseCmd
    }
    configCmd :+ file
  }

  private def runToolCommand(
      command: List[String],
      source: Source.Directory,
      cfgOpt: Option[String]
  ): Try[List[Result]] = {
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
  }

  override def apply(
      source: Source.Directory,
      configuration: Option[List[Pattern.Definition]],
      files: Option[Set[Source.File]],
      options: Map[Options.Key, Options.Value]
  )(implicit specification: Tool.Specification): Try[List[Result]] = {
    Try {

      val filesToLint = listOfFilesToLint(files, source)

      val cfgOpt = lintConfiguration(source, configuration)

      filesToLint.flatMap { file =>
        val command: List[String] = commandToRun(cfgOpt, file)

        val fileCommandAnalysisResult = runToolCommand(command, source, cfgOpt)
        fileCommandAnalysisResult match {
          case Success(res) => res
          case Failure(exception) =>
            List(
              FileError(Source.File(file), Some(ErrorMessage(s"Failed to analyse file $file: ${exception.getMessage}")))
            )
        }
      }
    }
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
            Source.Line(violation.line)
          )
        )
      }
    }
  }
}
