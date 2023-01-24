package codacy.dartanalyzer

import better.files.File
import com.codacy.plugins.api.results.{Pattern, Result, Tool}
import com.codacy.plugins.api.{Options, Source}
import com.codacy.tools.scala.seed.DockerEngine
import com.codacy.tools.scala.seed.utils.CommandRunner
import play.api.libs.json.Json

import java.io.{BufferedWriter, FileWriter, File => JavaFile}
import scala.util.Try

object DartAnalyzer extends Tool {

  override def apply(
      source: Source.Directory,
      configuration: Option[List[Pattern.Definition]],
      files: Option[Set[Source.File]],
      options: Map[Options.Key, Options.Value]
  )(implicit specification: Tool.Specification): Try[List[Result]] = Try {

    val patternsType = Json
      .parse(File("/docs/patterns_type.json").contentAsString)
      .as[Map[String, String]]

    configuration.fold {
      System.err.println("No configuration patterns")
    } { configurationPatterns =>
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

      // Write into the analysis_options for dart analyze in root folder
      val file = new JavaFile("/analysis_options.yaml")
      val bufferedWriter: BufferedWriter =
        new BufferedWriter(new FileWriter(file))
      bufferedWriter.write(optionsFileContent)
      bufferedWriter.close()
    }

    val filesToAnalyse = files.fold(Set(source.path))(_.map(_.path))
    System.err.println(s"Files to analyse: $filesToAnalyse")

    val command =
      List(
        "dart",
        "analyze",
        "--format",
        // json format returns multiple objects after a given limit, change if only required
        "machine"
      ) ++ filesToAnalyse

    CommandRunner.exec(command).toTry.map { commandResult =>
      System.err.println(s"EXIT CODE ${commandResult.exitCode}")
      System.err.println("ERROR")
      commandResult.stderr.foreach(System.err.println)
      System.err.println("STDOUT")
      commandResult.stdout.foreach(System.err.println)

      sanitizeOutput(commandResult.stdout)
        .map(parseMachineFormat)
    }
  }.flatten

  // Part messages on version 2.17.0
  val partInfoMessage = "Please pass in a library that contains this part."
  val partMessage = "is a part and cannot be analyzed."

  // We need to sanitize the output because the deprecated message and other feature we do not yet support
  def sanitizeOutput(stderr: List[String]): List[String] = {
    stderr
      .filterNot(line =>
        line.contains(partMessage) ||
          line.contains(partInfoMessage)
      )
  }

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
      case _ =>
        throw new RuntimeException(
          s"Unable to parse machine format from dart analyze $outputLine"
        )
    }
  }
}

object Engine extends DockerEngine(DartAnalyzer)()
