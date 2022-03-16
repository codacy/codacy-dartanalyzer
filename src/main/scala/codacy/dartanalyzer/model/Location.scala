package codacy.dartanalyzer.model

import play.api.libs.json.Json

case class Location(file: String, range: Range)

object Location {
  implicit val reads = Json.reads[Location]
}
