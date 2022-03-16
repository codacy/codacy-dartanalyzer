package codacy.dartanalyzer.model

import play.api.libs.json.Json

case class Diagnostic(
    code: String,
    severity: String,
    // `type`: String,
    location: Location,
    problemMessage: String,
    correctionMessage: Option[String],
    documentation: String
)

object Diagnostic {
  implicit val reads = Json.reads[Diagnostic]
}
