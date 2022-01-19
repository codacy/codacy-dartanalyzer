package codacy.dartanalyzer

import better.files.File
import com.codacy.plugins.api.results.{Pattern, Result, Tool}
import com.codacy.plugins.api.{Options, Source, patternTimeToFixFormat}
import com.codacy.tools.scala.seed.utils.{CommandResult, CommandRunner}
import play.api.libs.json.{Json, __}
//import play.api.libs.json._

import scala.util.Try
import com.codacy.tools.scala.seed.DockerEngine

object DartAnalyzer extends Tool {

  override def apply(
      source: Source.Directory,
      configuration: Option[List[Pattern.Definition]],
      files: Option[Set[Source.File]],
      options: Map[Options.Key, Options.Value]
  )(implicit specification: Tool.Specification): Try[List[Result]] = Try {
    val formatOutput = "machine"

    val f = files.get

    val ignoredPatters = specification.patterns
      .filter(pattern => !configuration.getOrElse(List.empty).map(_.patternId).contains(pattern.patternId))

    val patterns =
      ignoredPatters.map(pattern => s"    ${pattern.patternId}: ignore").mkString("\n") ++ "\n" ++
      configuration.getOrElse(List.empty).map(pattern => s"    ${pattern.patternId}: error").mkString("\n")

    val optionsFileContent =
      s"""
      |analyzer:
      |  errors:
      |${patterns}
      """.stripMargin

    //println(optionsFileContent)

    val optionsFilePath = File.newTemporaryFile().writeText(optionsFileContent).path.toString

    //println(optionsFilePath)

    val paths = f.map(_.path)
    val command = List("dartanalyzer", "--format", formatOutput, "--options", optionsFilePath) ++ paths

    //println(command)

    val res: Either[Throwable, CommandResult] = CommandRunner.exec(command)

    val stdout = res match {
      case Left(ex) => throw ex
      case Right(v) => v.stderr
    }

    val result = formatOutput match {
      case "json" =>
        val parsed = Json.parse(stdout.mkString("\n"))
        parsed.as[DartAnalyzerResult]
      case "machine" =>
        val parsedDiagnostics = stdout.map(parseMachineFormat)
        DartAnalyzerResult(diagnostics = parsedDiagnostics)
    }

    convert(result)
  }

  
  def parseMachineFormat(outputLine: String): Diagnostic = {
    outputLine.split('|') match {
      case Array(severity, _type, name, file, lineNumber, columnNumber, length, problemMessage) =>
        Diagnostic(
          severity = severity,
          `type` = _type,
          code = name.toLowerCase,
          location =
            Location(
              file = file,
              range = Range(
                start = Position(offset = length.toInt, line = lineNumber.toInt, column = columnNumber.toInt),
                end = None)),
          problemMessage = problemMessage,
          correctionMessage = None,
          documentation = None
        )
      case _ => throw new RuntimeException("Unable to parse machine format from dartanalyzer")
    }
    
  }


  def convert(dartAnalyzerResult: DartAnalyzerResult): List[Result] = {
    dartAnalyzerResult.diagnostics.map { diagnostic =>
      Result.Issue(
        file = Source.File(diagnostic.location.file),
        message = Result.Message(diagnostic.problemMessage),
        patternId = Pattern.Id(diagnostic.code),
        line = Source.Line(diagnostic.location.range.start.line)
      )
    }.toList
  }

}

object Engine extends DockerEngine(DartAnalyzer)()
