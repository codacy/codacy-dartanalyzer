package codacy.dartanalyzer.model

import play.api.libs.json.Json

case class DartAnalyzeResult(version: Int, diagnostics: Seq[Diagnostic])

object DartAnalyzeResult {
  implicit val reads = Json.reads[DartAnalyzeResult]
}
