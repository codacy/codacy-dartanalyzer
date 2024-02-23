organization := "com.codacy"

name := "codacy-dartanalyzer"

scalaVersion := "2.13.12"

ThisBuild / libraryDependencySchemes += "org.scala-lang.modules" %% "scala-xml" % "always"

enablePlugins(JavaAppPackaging)
enablePlugins(GraalVMNativeImagePlugin)

libraryDependencies ++= Seq(
  "com.codacy" %% "codacy-engine-scala-seed" % "6.1.2",
  "org.scalameta" %% "svm-subs" % "20.2.0",
  "org.scalatest" %% "scalatest" % "3.2.18" % Test,
  "com.github.pathikrit" %% "better-files" % "3.9.2",
  "org.scala-lang.modules" %% "scala-xml" % "2.1.0"
)

scalacOptions -= "-Xfatal-warnings"

graalVMNativeImageGraalVersion := Some("22.3.3")
graalVMNativeImageOptions ++= Seq(
  "-O1",
  "-H:+ReportExceptionStackTraces",
  "--no-fallback",
  "--no-server",
  "--report-unsupported-elements-at-runtime",
  "--static"
)
