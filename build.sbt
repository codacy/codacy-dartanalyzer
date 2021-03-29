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

enablePlugins(GraalVMNativeImagePlugin)

libraryDependencies ++= Seq(
  "com.codacy" %% "codacy-engine-scala-seed" % "5.0.1",
  "org.scalameta" %% "svm-subs" % "20.2.0"
)

graalVMNativeImageGraalVersion := Some("21.0.0")
graalVMNativeImageOptions ++= Seq(
  "-O1",
  "-H:+ReportExceptionStackTraces",
  "--no-fallback",
  "--no-server",
  "--report-unsupported-elements-at-runtime",
  "--static"
)
