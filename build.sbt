import com.typesafe.sbt.packager.docker.{Cmd, ExecCmd}

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

val swiftlintVersion = "0.25.0"

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

dockerBaseImage := "norionomura/swiftlint"

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
