import $ivy.`com.codacy::codacy-engine-scala-seed:5.0.3`

import com.codacy.plugins.api._
import com.codacy.plugins.api.results._
import play.api.libs.json.Json

val tempDir = os.temp.dir(dir = os.pwd / "target")

val workdir = "/workdir"

val baseCommand = Seq(
  "docker",
  "run",
  s"--volume=$tempDir:$workdir",
  s"-w=$workdir",
  s"--user=root",
  "--entrypoint=swiftlint",
  "codacy-swiftlint"
)

os.proc(baseCommand :+ "generate-docs").call()
// Hack: docker in CircleCI makes files only available to the root user 
os.proc("sudo", "chmod", "-R", "777", tempDir).call()

val rulesOutput = os.proc(baseCommand :+ "rules").call().out.lines().map(_.split('|').map(_.trim).toList.tail).tail

val version = os.proc(baseCommand :+ "version").call().out.text().trim

val mdFiles = os.list(tempDir / "rule_docs").filter(_.last != "Rule Directory.md")

val docsDirectory = os.pwd / "docs"
val descriptionDirectory = docsDirectory / "description"

val patternDescriptions = mdFiles.map { file =>
  val patternId = file.last.stripSuffix(".md")
  val lines = os.read(file).linesIterator
  val title = lines.next().stripPrefix("# ")
  lines.next()
  val description = lines.next()
  Pattern.Description(Pattern.Id(patternId), Pattern.Title(title), Some(Pattern.DescriptionText(description)), None)
}

val ids = rulesOutput.head.zipWithIndex.toMap

case class SwiftlintRule(
    identifier: String,
    correctable: Boolean,
    enabledInYourConfig: Boolean,
    kind: String,
    configuration: String
)

val swiftLintRules = rulesOutput.tail
  .filter(_.length == ids.size)
  .map { arr =>
    def toBoolean(s: String) = s == "yes"
    SwiftlintRule(
      identifier = arr(ids("identifier")),
      correctable = toBoolean(arr(ids("correctable"))),
      enabledInYourConfig = toBoolean(arr(ids("enabled in your config"))),
      kind = arr(ids("kind")),
      configuration = arr(ids("configuration"))
    )
  }

def configurationToLevel(kind: String) = kind match {
  case "warning" => Result.Level.Warn
  case "error" => Result.Level.Err
  case _ => Result.Level.Info
}

def kindToCategory(kind: String) = kind match {
  case "style" => Pattern.Category.CodeStyle
  case "lint" => Pattern.Category.ErrorProne
  case "performance" => Pattern.Category.Performance
  case "metrics" => Pattern.Category.Complexity
  case _ => Pattern.Category.ErrorProne
}

val patternSpecifications = swiftLintRules.map { swiftLintRule =>
  Pattern.Specification(
    Pattern.Id(swiftLintRule.identifier),
    configurationToLevel(swiftLintRule.configuration),
    kindToCategory(swiftLintRule.kind),
    subcategory = None,
    enabled = swiftLintRule.enabledInYourConfig
  )
}

val specification = Tool.Specification(Tool.Name("swiftlint"), Some(Tool.Version(version)), patternSpecifications.toSet)

os.write.over(os.pwd / "docs" / "patterns.json", Json.prettyPrint(Json.toJson(specification)) + "\n")
os.remove.all(descriptionDirectory)
mdFiles.foreach(os.copy.into(_, descriptionDirectory, replaceExisting = true, createFolders = true))
os.write.over(descriptionDirectory / "description.json", Json.prettyPrint(Json.toJson(patternDescriptions)) + "\n")
os.remove.all(tempDir)
