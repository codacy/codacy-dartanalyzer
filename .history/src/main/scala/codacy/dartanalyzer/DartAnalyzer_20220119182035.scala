package codacy.dartanalyzer

import com.codacy.plugins.api.results.{Pattern, Result, Tool}
import com.codacy.plugins.api.{Options, Source}
import com.codacy.tools.scala.seed.utils.{CommandResult, CommandRunner}
import play.api.libs.json._

import scala.util.Try
import com.codacy.tools.scala.seed.DockerEngine

object DartAnalyzer extends Tool {

  override def apply(
      source: Source.Directory,
      configuration: Option[List[Pattern.Definition]],
      files: Option[Set[Source.File]],
      options: Map[Options.Key, Options.Value]
  )(implicit specification: Tool.Specification): Try[List[Result]] = Try {
    val f = files.get
    
    //print(specification.patterns)
    print(configuration.get.last.patternId)

    /*
    val optionsFileContent =
      s"""
      |analyzer:
      |  errors:
      |    ${patterns}
      """
    */

    val paths = f.map(_.path)
    val command = List("dartanalyzer", "--format", "json") ++ paths
    println(command)
    val res: Either[Throwable, CommandResult] = CommandRunner.exec(command)

    val stdout = res match {
      case Left(ex) => throw ex
      case Right(v) => v.stdout
    }

    val parsed = Json.parse(stdout.mkString("\n"))
    val result = parsed.as[DartAnalyzerResult]

    convert(result)
  }

  
  def parseMachineFormat(output: String): DartAnalyzerResult = {
    val parsed = output.split('|')

    val severity = parsed(0)
    val `type` = parsed(1)
    val name = parsed(2)
    val file = parsed(3)
    val lineNumber = parsed(4)
    val columnNumber = parsed(5)
    val length = parsed(6)
    val problemMessage = parsed(7)

    Diagnostic(
      severity = severity,
      code = name.to
    )
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
