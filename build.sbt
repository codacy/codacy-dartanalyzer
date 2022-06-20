organization := "com.codacy"

name := "codacy-dartanalyzer"

scalaVersion := "2.13.8"

enablePlugins(JavaAppPackaging)
enablePlugins(GraalVMNativeImagePlugin)

libraryDependencies ++= Seq(
  "com.codacy" %% "codacy-engine-scala-seed" % "6.0.1",
  "org.scalameta" %% "svm-subs" % "20.2.0",
  "org.scalatest" %% "scalatest" % "3.2.12" % Test
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
