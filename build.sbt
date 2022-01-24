organization := "com.codacy"

name := "codacy-dartanalyzer"

scalaVersion := "2.13.8"

lazy val dartanalyzerVersion = Def.setting("1.10.0")

Compile / sourceGenerators += Def.task {
  val file =
    (Compile / sourceManaged).value / "codacy" / "dartanalyzer" / "Versions.scala"
  IO.write(
    file,
    s"""package codacy.dartanalyzer
                    |object Versions {
                    |  val dartanalyzerVersion: String = "${dartanalyzerVersion.value}"
                    |}
                    |""".stripMargin
  )
  Seq(file)
}.taskValue

enablePlugins(JavaAppPackaging)
enablePlugins(GraalVMNativeImagePlugin)

libraryDependencies ++= Seq(
  "com.codacy" %% "codacy-engine-scala-seed" % "5.0.3",
  "org.scalameta" %% "svm-subs" % "20.2.0"
)

scalacOptions -= "-Xfatal-warnings"

graalVMNativeImageGraalVersion := Some("21.0.0")
graalVMNativeImageOptions ++= Seq(
  "-O1",
  "-H:+ReportExceptionStackTraces",
  "--no-fallback",
  "--no-server",
  "--report-unsupported-elements-at-runtime",
  "--static"
)
