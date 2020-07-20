organization := "com.codacy"

name := "codacy-swiftlint"

scalaVersion := "2.13.3"

libraryDependencies += "com.codacy" %% "codacy-engine-scala-seed" % "4.0.3"

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
