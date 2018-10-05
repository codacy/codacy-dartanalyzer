import com.typesafe.sbt.packager.docker.{Cmd, ExecCmd}
import scala.util.parsing.json.JSON
import scala.io.Source

name := """codacy-swiftlint"""

version := "1.0.0-SNAPSHOT"

val languageVersion = "2.12.7"

scalaVersion := languageVersion
scalacOptions ++= Seq("-Ywarn-unused")

scapegoatVersion in ThisBuild := "1.3.4"

resolvers ++= Seq(
  "Sonatype OSS Snapshots" at "https://oss.sonatype.org/content/repositories/releases",
  "Typesafe Repo" at "http://repo.typesafe.com/typesafe/releases/")

libraryDependencies ++= Seq("com.codacy" %% "codacy-engine-scala-seed" % "3.0.183" withSources ())

enablePlugins(AshScriptPlugin)

enablePlugins(DockerPlugin)

version in Docker := "1.0.0-SNAPSHOT"

organization := "com.codacy"

lazy val toolVersion = SettingKey[String]("retrieve the version of the underlying tool from patterns.json")

toolVersion := {
  val jsonFile = (resourceDirectory in Compile).value / "docs" / "patterns.json"
  val toolMap = JSON
    .parseFull(Source.fromFile(jsonFile).getLines().mkString)
    .getOrElse(throw new Exception("patterns.json is not a valid json"))
    .asInstanceOf[Map[String, String]]
  toolMap.getOrElse[String]("version", throw new Exception("Failed to retrieve 'version' from patterns.json"))
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

dockerBaseImage := s"codacy/swiftlint"

dockerCommands := dockerCommands.value.flatMap {
  case cmd @ (Cmd("ADD", _)) =>
    List(
      Cmd("RUN", s"""adduser --uid 2004 --disabled-password --gecos \"\" $dockerUser"""),
      cmd,
      Cmd("RUN", "mv /opt/docker/docs /docs"))
  case other => List(other)
}
