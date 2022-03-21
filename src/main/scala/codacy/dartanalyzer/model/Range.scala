package codacy.dartanalyzer.model

import play.api.libs.json.Json

case class Range(start: Position, end: Position)

object Range {
  implicit val reads = Json.reads[Range]
}
