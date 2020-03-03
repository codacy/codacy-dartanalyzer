import com.typesafe.sbt.packager.docker.{Cmd, ExecCmd}
import sjsonnew._
import sjsonnew.BasicJsonProtocol._
import sjsonnew.support.scalajson.unsafe._

organization := "com.codacy"

name := "codacy-swiftlint"

scalaVersion := "2.13.1"

libraryDependencies += "com.codacy" %% "codacy-engine-scala-seed" % "4.0.0"

enablePlugins(AshScriptPlugin)

enablePlugins(DockerPlugin)

lazy val toolVersionKey = settingKey[String]("The version of the underlying tool retrieved from patterns.json")

toolVersionKey := {
  case class Patterns(name: String, version: String)
  implicit val patternsIso: IsoLList[Patterns] =
    LList.isoCurried((p: Patterns) => ("name", p.name) :*: ("version", p.version) :*: LNil) {
      case (_, n) :*: (_, v) :*: LNil => Patterns(n, v)
    }

  val jsonFile = (resourceDirectory in Compile).value / "docs" / "patterns.json"
  val json = Parser.parseFromFile(jsonFile)
  val patterns = json.flatMap(Converter.fromJson[Patterns])
  patterns.get.version
}

mappings in Universal ++= {
  (resourceDirectory in Compile) map { (resourceDir: File) =>
    val src = resourceDir / "docs"
    val dest = "/docs"

    for {
      path <- src.allPaths.get if !path.isDirectory
    } yield path -> path.toString.replaceFirst(src.toString, dest)
  }
}.value

val dockerUser = "docker"
val dockerGroup = "docker"

daemonUser in Docker := dockerUser

daemonGroup in Docker := dockerGroup

dockerBaseImage := "codacy-swiftlint-base"

dockerCommands := dockerCommands.value.flatMap {
  case cmd @ (Cmd("ADD", _)) =>
    List(
      Cmd("RUN", s"""adduser --uid 2004 --disabled-password --gecos \"\" $dockerUser"""),
      cmd,
      Cmd("RUN", "mv /opt/docker/docs /docs")
    )
  case other => List(other)
}
