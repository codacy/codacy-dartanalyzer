package codacy

import codacy.dockerApi.DockerEngine
import codacy.swiftlint.SwiftLint

object Engine extends DockerEngine(SwiftLint)
