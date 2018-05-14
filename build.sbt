import com.typesafe.sbt.packager.docker.{Cmd, ExecCmd}
import scala.util.parsing.json.JSON
import scala.io.Source

name := """codacy-swiftlint"""

version := "1.0.0-SNAPSHOT"

val languageVersion = "2.11.11"

scalaVersion := languageVersion

resolvers ++= Seq(
  "Sonatype OSS Snapshots" at "https://oss.sonatype.org/content/repositories/releases",
  "Typesafe Repo" at "http://repo.typesafe.com/typesafe/releases/"
)

libraryDependencies ++= Seq(
  "com.typesafe.play" %% "play-json" % "2.4.8",
  "com.codacy" %% "codacy-engine-scala-seed" % "2.7.9" withSources()
)

enablePlugins(JavaAppPackaging)

enablePlugins(DockerPlugin)

version in Docker := "1.0.0-SNAPSHOT"

organization := "com.codacy"

lazy val toolVersion = SettingKey[String]("Retrieve the version of the underlying tool from patterns.json")

toolVersion := {
  val jsonFile = (resourceDirectory in Compile).value / "docs" / "patterns.json"
  val toolMap = JSON.parseFull(Source.fromFile(jsonFile).getLines().mkString)
    .getOrElse(throw new Exception("patterns.json is not a valid json"))
    .asInstanceOf[Map[String, String]]
  toolMap.getOrElse[String]("version", throw new Exception("Failed to retrieve 'version' from patterns.json"))
}

val installAll =
  s"""apt-get update &&
     |apt-get install default-jre --assume-yes""".stripMargin.replaceAll(System.lineSeparator(), " ")

mappings in Universal <++= (resourceDirectory in Compile) map { (resourceDir: File) =>
  val src = resourceDir / "docs"
  val dest = "/docs"

  for {
    path <- (src ***).get
    if !path.isDirectory
  } yield path -> path.toString.replaceFirst(src.toString, dest)
}


val dockerUser = "docker"
val dockerGroup = "docker"

daemonUser in Docker := dockerUser

daemonGroup in Docker := dockerGroup

dockerBaseImage := s"norionomura/swiftlint:${toolVersion.value}"

dockerCommands := dockerCommands.value.flatMap {
  case cmd@Cmd("WORKDIR", _) => List(cmd,
    Cmd("RUN", installAll)
  )
  case cmd@(Cmd("ADD", "opt /opt")) => List(cmd,
    Cmd("RUN", "mv /opt/docker/docs /docs"),
    Cmd("RUN", s"""adduser --uid 2004 --disabled-password --gecos \"\" $dockerUser"""),
    ExecCmd("RUN", Seq("chown", "-R", s"$dockerUser:$dockerGroup", "/docs"): _*)
  )
  case other => List(other)
}
