package codacy.dartanalyzer

import better.files.File
import codacy.dartanalyzer.model.DartAnalyzeResult
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

    val batchFiles = files.toSet.flatten

    val patternsType = Json
      .parse(File("/docs/patterns_type.json").contentAsString)
      .as[Map[String, String]]

    val optionsFilePath = configuration match {
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

    val filesToAnalyse = batchFiles.map(_.path)
    val command =
      List(
        "dartanalyzer",
        "--format",
        "json"
      ) ++ optionsFilePath ++ filesToAnalyse

    CommandRunner.exec(command).toTry.map { commandResult =>
      parseJsonFormat(commandResult.stdout.mkString)
    }
  }.flatten

  def parseJsonFormat(outputLine: String): List[Result] = {

    Json
      .parse(outputLine)
      .validate[DartAnalyzeResult]
      .fold[List[Result]](
        errors =>
          throw new Exception(
            s"Unable to parse json format from dartanalyzer: $outputLine errors: $errors"
          ),
        dartAnalyzeResult => {
          dartAnalyzeResult.diagnostics
            .map[Result](diagnostic => {
              Result.Issue(
                file = Source.File(diagnostic.location.file),
                message = Result.Message(diagnostic.problemMessage),
                patternId = Pattern.Id(diagnostic.code.toLowerCase),
                line = Source.Line(diagnostic.location.range.start.line)
              )
            })
            .toList
        }
      )
  }
}

object Engine extends DockerEngine(DartAnalyzer)()
