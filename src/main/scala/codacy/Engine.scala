package codacy

import com.codacy.tools.scala.seed.DockerEngine
import codacy.swiftlint.SwiftLint

object Engine extends DockerEngine(SwiftLint)()
