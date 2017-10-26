package codacy.swiftlint

import java.nio.file.{Path, Paths}

import codacy.docker.api._
import codacy.docker.api.utils.ToolHelper
import codacy.docker.api.{Pattern, Result, Source, Tool}
import codacy.dockerApi.utils.{CommandRunner, FileHelper}

import scala.util.{Failure, Properties, Success, Try}
import scala.collection.mutable.ListBuffer

object SwiftLint extends Tool {

 private lazy val configFileNames = Set(".swiftlint.yml")

 override def apply(source: Source.Directory, configuration: Option[List[Pattern.Definition]],
                      files: Option[Set[Source.File]], options: Map[Configuration.Key, Configuration.Value])
                     (implicit specification: Tool.Specification): Try[List[Result]] = {
    Try {

      val path = Paths.get(source.path)
      lazy val nativeConfig = FileHelper.findConfigurationFile(configFileNames, path).map(_.toString)
      val filesToLint: Set[String] = ToolHelper.filesToLint(source, files)
      val patternsToLintOpt: Option[List[codacy.docker.api.Pattern.Definition]] = ToolHelper.patternsToLint(configuration)

      val config = patternsToLintOpt.fold(Option.empty[String]) {
          case patternsToLint if patternsToLint.nonEmpty =>
            Some(writeConfigFile(patternsToLint).toString)
        }

      val cfgOpt = nativeConfig.orElse(config)

      val command = cfgOpt match {
        case Some(opt) => List("swiftlint", "--config", opt, "--path") ++ filesToLint
        case None    => List("swiftlint", "--path") ++ filesToLint
      }

      CommandRunner.exec(command, Some(path.toFile)) match {
        case Right(resultFromTool) =>
        parseToolResult(path, resultFromTool.stdout) match {
         case s@Success(_) => s
         case Failure(e) =>
           val msg =
             s"""
                |${this.getClass.getSimpleName} exited with code ${resultFromTool.exitCode}
                |command: ${command.mkString(" ")}
                |message: ${e.getMessage}
                |stdout: ${resultFromTool.stdout.mkString(Properties.lineSeparator)}
                |stderr: ${resultFromTool.stderr.mkString(Properties.lineSeparator)}
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
      val separator = s"""
  - """
      val content =
      s"""whitelist_rules:
  - ${rules.mkString(separator)}""".stripMargin

    FileHelper.createTmpFile(content, ".swiftlint-ci", ".yml")
  }

  private def parseToolResult(path: Path, output: List[String]): Try[List[Result]] = {

    var result = new ListBuffer[Result]()

    output.foreach { line =>
        result += parseToolResult(line)
    }

    Try(result.toList)
  }

  private def parseToolResult(output: String): Result = {
    /* Example:
     * {PATH}:{LINE}[:COLUMN]:{SEVERITY}:{TITLE}:{MESSAGE}({KEY})
     * /src/VulcanBt/VulcanBt_iOS/Source/Generic/KeychainItemAccessibility.swift:60:11: warning: Colon Violation: Colons should be next to the identifier when specifying a type and next to the key in dictionary literals. (colon)
     */
    val columns = output.split(":")

    if (columns.size == 5 || columns.size == 6) {
      val violation = columns(columns.size - 1).trim.split("\\(")

        Result.Issue(
          Source.File(columns(0)),
          Result.Message(violation(0).trim),
          Pattern.Id(violation(1).trim.dropRight(1)),
          Source.Line(columns(1).toInt)
        )
    } else {
      Result.FileError(Source.File(columns(0)), message = None)
    }
  }
}
