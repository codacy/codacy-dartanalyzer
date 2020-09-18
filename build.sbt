organization := "com.codacy"

name := "codacy-swiftlint"

scalaVersion := "2.13.3"

lazy val swiftlintVersion = Def.setting("1.10.0")

Compile / sourceGenerators += Def.task {
  val file = (Compile / sourceManaged).value / "codacy" / "swiftlint" / "Versions.scala"
  IO.write(file, s"""package codacy.swiftlint
                    |object Versions {
                    |  val swiftlintVersion: String = "${swiftlintVersion.value}"
                    |}
                    |""".stripMargin)
  Seq(file)
}.taskValue

libraryDependencies += "com.codacy" %% "codacy-engine-scala-seed" % "5.0.1"

enablePlugins(GraalVMNativeImagePlugin)

val graalVersion = "20.1.0-java11"

graalVMNativeImageGraalVersion := Some(graalVersion)
containerBuildImage := Some(s"oracle/graalvm-ce:$graalVersion")
graalVMNativeImageOptions ++= Seq(
  "-O1",
  "-H:+ReportExceptionStackTraces",
  "--no-fallback",
  "--no-server",
  "--initialize-at-build-time",
  "--report-unsupported-elements-at-runtime",
  "--static"
)
