package codacy.dartanalyzer.model

import play.api.libs.json.Json

case class Position(offset: Int, line: Int, column: Int)

object Position {
  implicit val reads = Json.reads[Position]
}
