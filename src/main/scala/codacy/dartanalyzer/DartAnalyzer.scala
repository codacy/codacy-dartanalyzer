package codacy.dartanalyzer

import better.files.File
import com.codacy.plugins.api.results.{Pattern, Result, Tool}
import com.codacy.plugins.api.{Options, Source}
import com.codacy.tools.scala.seed.utils.CommandRunner

import scala.util.Try
import com.codacy.tools.scala.seed.DockerEngine
import play.api.libs.json.Json

object DartAnalyzer extends Tool {

  override def apply(
      source: Source.Directory,
      configuration: Option[List[Pattern.Definition]],
      files: Option[Set[Source.File]],
      options: Map[Options.Key, Options.Value]
  )(implicit specification: Tool.Specification): Try[List[Result]] = Try {

    val f = files.toSet.flatten

    val patternsType = Json
      .parse(File("/docs/patterns_type.json").contentAsString)
      .as[Map[String, String]]

    val optionsFileOptions = configuration match {
      case Some(configurationPatterns) =>
        val configurationPatternIds: Set[Pattern.Id] =
          configurationPatterns.map(_.patternId).toSet

        val lintPatterns = specification.patterns
          .filter(pattern => patternsType(pattern.patternId.value) == "lint")
          .map { pattern =>
            if (configurationPatternIds.contains(pattern.patternId)) {
              s"    ${pattern.patternId.value}: true"
            } else {
              s"    ${pattern.patternId.value}: false"
            }

          }
          .mkString("\n")

        val errorPatterns = specification.patterns
          .filter(pattern => patternsType(pattern.patternId.value) == "error")
          .map { pattern =>
            if (configurationPatternIds.contains(pattern.patternId)) {
              s"    ${pattern.patternId.value}: ${pattern.level.toString.toLowerCase}"
            } else {
              s"    ${pattern.patternId.value}: ignore"
            }

          }
          .mkString("\n")

        val optionsFileContent =
          s"""
          |analyzer:
          |  errors:
          |${errorPatterns}
          |linter:
          |  rules:
          |${lintPatterns}
          |""".stripMargin

        val optionsFilePath =
          File.newTemporaryFile().writeText(optionsFileContent).path.toString
        Seq("--options", optionsFilePath)
      case None =>
        Seq.empty[String]
    }

    val paths = f.map(_.path)
    val command =
      List("dartanalyzer", "--format", "machine") ++ optionsFileOptions ++ paths

    CommandRunner.exec(command).toTry.map { commandResult =>
      val stderr = commandResult.stderr.map(_.trim).filter(_.nonEmpty)
      stderr.map(parseMachineFormat)
    }
  }.flatten

  def parseMachineFormat(outputLine: String): Result = {
    outputLine.split('|') match {
      case Array(
            severity,
            _type,
            name,
            file,
            lineNumber,
            columnNumber,
            length,
            problemMessage
          ) =>
        Result.Issue(
          file = Source.File(file),
          message = Result.Message(problemMessage),
          patternId = Pattern.Id(name.toLowerCase),
          line = Source.Line(lineNumber.toInt)
        )
      case array =>
        throw new Exception(
          s"Unable to parse machine format from dartanalyzer: ${array.toList}"
        )
    }
  }
}

object Engine extends DockerEngine(DartAnalyzer)()
