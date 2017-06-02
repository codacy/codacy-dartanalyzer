package codacy.swiftlint

import java.nio.file.Path

import codacy.dockerApi._
import codacy.dockerApi.utils.{CommandRunner, ToolHelper}
import play.api.libs.json._

import scala.util.{Failure, Properties, Success, Try}
import scala.collection.mutable.ListBuffer

case class SwiftLintViolationLocation(line: Int, column: Option[Int])

case class SwiftLintViolation(severity: String, rule: String, location: SwiftLintViolationLocation, message: String)

case class SwiftLintFile(path: String, violations: List[SwiftLintViolation], parsed: Boolean)

object SwiftLintFile {
  implicit val SwiftLintViolationLocationFmt = Json.format[SwiftLintViolationLocation]
  implicit val SwiftLintViolationFmt = Json.format[SwiftLintViolation]
  implicit val SwiftLintFileFmt = Json.format[SwiftLintFile]
}

object SwiftLint extends Tool {

  override def apply(path: Path, conf: Option[List[PatternDef]], files: Option[Set[Path]])(implicit spec: Spec): Try[List[Result]] = {
    Try {

      val rootDirectory = path.toFile
      val command = List("swiftlint")

      CommandRunner.exec(command, Some(rootDirectory)) match {
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

  private def parseToolResult(path: Path, output: List[String]): Try[List[Result]] = {

    var result = new ListBuffer[Result]()

    output.foreach { line =>
        result += parseToolResult(line)
    }

    Try(result.toList)
  }

  private def parseToolResult(output: String): Result = {
    /* Example:
     * {PATH}:{LINE}:{SEVERITY}:{TITLE}:{MESSAGE}({KEY})
     * /src/VulcanBt/VulcanBt_iOS/Source/Generic/KeychainItemAccessibility.swift:60:11: warning: Colon Violation: Colons should be next to the identifier when specifying a type and next to the key in dictionary literals. (colon)
     */
    val columns = output.split(":")

    if (columns.size == 5 || columns.size == 6) {
      val violation = columns(columns.size - 1).trim.split("\\(")

        Issue(
          SourcePath(columns(0)),
          ResultMessage(violation(0).trim),
          PatternId(violation(1).trim.dropRight(1)),
          ResultLine(columns(1).toInt)
        )
    } else {
      FileError(SourcePath(columns(0)), message = None)
    }
  }
}
