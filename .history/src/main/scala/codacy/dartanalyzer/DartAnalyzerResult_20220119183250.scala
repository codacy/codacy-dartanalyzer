package codacy.dartanalyzer

import play.api.libs.json.Json

case class Position(offset: Int, line: Int, column: Int)
object Position {
  implicit val format = Json.format[Position]
}
case class Range(start: Position, end: OpPosition)
object Range {
  implicit val format = Json.format[Range]
}
case class Location(file: String, range: Range)
object Location {
  implicit val format = Json.format[Location]
}
case class Diagnostic(
    code: String,
    severity: String,
    `type`: String,
    location: Location,
    problemMessage: String,
    correctionMessage: Option[String],
    documentation: Option[String]
)
object Diagnostic {
  implicit val format = Json.format[Diagnostic]
}
case class DartAnalyzerResult(diagnostics: Seq[Diagnostic])
object DartAnalyzerResult {
  implicit val format = Json.format[DartAnalyzerResult]
}
