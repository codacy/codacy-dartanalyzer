import 'dart:io';

import 'package:analyzer/src/lint/registry.dart';
import 'package:linter/src/analyzer.dart';
import 'package:linter/src/rules.dart';

import 'dart:convert';

void main() {
  final encoder = new JsonEncoder.withIndent("  ");

  //clear existing docs
  if (new Directory("docs/description").existsSync()) {
    new Directory("docs/description").deleteSync(recursive: true);
  }
  if (new File("docs/patterns.json").existsSync()) {
    new File("docs/patterns.json").deleteSync(recursive: true);
  }

  //create description dir
  new Directory("docs/description").createSync(recursive: true);

  registerLintRules();

  Iterable<LintRule> rules = Registry.ruleRegistry.rules;

  List<PatternSpec> patterns = List.empty(growable: true);
  List<Description> descriptions = List.empty(growable: true);

  rules.forEach((rule) {
    var pattern = PatternSpec(
        patternId: rule.name,
        level: rule.group.name == "errors" ? "Error" : "Info",
        category: rule.group.name);

    patterns.add(pattern);

    var splited = rule.name.split("_").join(" ");
    var title = splited[0].toUpperCase() + splited.substring(1);

    descriptions.add(Description(
        patternId: rule.name, title: title, description: rule.description));

    File("docs/description/" + rule.name + ".md").writeAsStringSync(
      rule.details,
    );
  });

  print(encoder.convert(PatternsFile(patterns: patterns)));

  File("docs/description/description.json")
      .writeAsStringSync(encoder.convert(descriptions));

  File("docs/patterns.json")
      .writeAsStringSync(encoder.convert(PatternsFile(patterns: patterns)));
}

class PatternsFile {
  final String name = "Dart";
  final String version = "1.18.0";
  final List<PatternSpec> patterns;

  PatternsFile({this.patterns});

  Map<String, dynamic> toJson() =>
      {'name': name, 'version': version, 'patterns': patterns};
}

class Description {
  final String patternId;
  final String title;
  final String description;

  Description({this.patternId, this.title, this.description});

  Map<String, dynamic> toJson() =>
      {'patternId': patternId, 'title': title, 'description': description};
}

//@JsonSerializable()
class PatternSpec {
  final String patternId;
  final String level;
  final String category;
  //parameters: ParameterSpec[]
  //enabled: Boolean

  PatternSpec({this.patternId, this.level, this.category});

  Map<String, dynamic> toJson() =>
      {'patternId': patternId, 'level': level, 'category': category};
}
