import 'dart:io';

import 'package:analyzer/src/lint/registry.dart';
import 'package:linter/src/analyzer.dart';
import 'package:linter/src/rules.dart';

import 'dart:convert';
import 'package:yaml/yaml.dart';
import 'package:analyzer/src/services/lint.dart' as linterReg;

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

  Set<PatternSpec> patterns = {};
  Set<Description> descriptions = {};

  rules.forEach((rule) {
    var pattern = PatternSpec(
        patternId: rule.name,
        level: rule.group.name == "errors" ? "Error" : "Info",
        category: rule.group.name == "style" ? "CodeStyle" : "ErrorProne");

    patterns.add(pattern);

    var splited = rule.name.split("_").join(" ");
    var title = splited[0].toUpperCase() + splited.substring(1);

    descriptions.add(Description(
        patternId: rule.name, title: title, description: rule.description));

    File("docs/description/" + rule.name + ".md").writeAsStringSync(
      rule.details,
    );
  });

  //Registry.ruleRegistry.rules does not have rules, so this was the solution
  // to get all the missing rules with md documentation
  final String sdkDir = "tempDartSdk";
  new Directory(sdkDir).createSync();

  Process.runSync('git', [
    'clone',
    '--depth',
    '1',
    'https://github.com/dart-lang/sdk.git',
    '$sdkDir'
  ]);

  final String messageFileContent =
      File(sdkDir + "/pkg/analyzer/messages.yaml").readAsStringSync();

  print(messageFileContent);
  Map<Object, Object> yaml =
      loadYaml(messageFileContent) as Map<Object, Object>;

  Map<String, Map<String, AnalyzerErrorCodeInfo>> messagePatterns =
      decodeAnalyzerMessagesYaml(yaml);
  print(messagePatterns);

  messagePatterns.forEach((key, group) {
    print("Group " + key);

    group.forEach((key, value) {
      String patternId = key.toLowerCase();
      print("PatternId: " + patternId);

      var pattern = PatternSpec(
          patternId: patternId, level: 'Warning', category: 'ErrorProne');

      patterns.add(pattern);

      var splited = patternId.split("_").join(" ");
      var title = splited[0].toUpperCase() + splited.substring(1);

      descriptions.add(
          Description(patternId: patternId, title: title, description: ''));

      File("docs/description/" + patternId + ".md")
          .writeAsStringSync(value.documentation ?? '#### ' + key);
    });
  });

  new Directory(sdkDir).deleteSync(recursive: true);

  print('--- Descriptions ---');
  print(descriptions.toList());
  File("docs/description/description.json")
      .writeAsStringSync(encoder.convert(descriptions.toList()));

  print('--- Patterns ---');
  print(encoder.convert(
      PatternsFile(patterns: patterns, version: linterReg.linterVersion)));
  File("docs/patterns.json")
      .writeAsStringSync(encoder.convert(PatternsFile(patterns: patterns)));
}

// Models

class PatternsFile {
  final String name = "Dart";
  String version;
  final Set<PatternSpec> patterns;

  PatternsFile({this.patterns, this.version = '1.18.0'});

  Map<String, dynamic> toJson() =>
      {'name': name, 'version': version, 'patterns': patterns.toList()};
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

//Dart Sdk

/// Decodes a YAML object (obtained from `pkg/analyzer/messages.yaml`) into a
/// two-level map of [ErrorCodeInfo], indexed first by class name and then by
/// error name.
Map<String, Map<String, AnalyzerErrorCodeInfo>> decodeAnalyzerMessagesYaml(
    Object yaml) {
  Never problem(String message) {
    throw 'Problem in pkg/analyzer/messages.yaml: $message';
  }

  var result = <String, Map<String, AnalyzerErrorCodeInfo>>{};
  if (yaml is! Map<Object, Object>) {
    problem('root node is not a map');
  }

  (yaml as Map<Object, Object>).forEach((key, value) {
    var className = key;
    if (className is! String) {
      problem('non-string class key ${json.encode(className)}');
    }
    var classValue = value;
    if (classValue is! Map<Object, Object>) {
      problem('value associated with class key $className is not a map');
    }
    (classValue as Map<Object, Object>).forEach((key, value) {
      var errorName = key;
      if (errorName is! String) {
        problem('in class $className, non-string error key '
            '${json.encode(errorName)}');
      }
      var errorValue = value;
      if (errorValue is! Map<Object, Object>) {
        problem('value associated with error $className.$errorName is not a '
            'map');
      }
      try {
        (result[className] ??= {})[errorName] =
            AnalyzerErrorCodeInfo.fromYaml(errorValue);
      } catch (e) {
        problem('while processing '
            '$className.$errorName, $e');
      }
    });
  });

  return result;
}

class AnalyzerErrorCodeInfo extends ErrorCodeInfo {
  AnalyzerErrorCodeInfo(
      {String comment,
      String correctionMessage,
      String documentation,
      bool hasPublishedDocs = false,
      bool isUnresolvedIdentifier = false,
      String problemMessage,
      String sharedName})
      : super(
            comment: comment,
            correctionMessage: correctionMessage,
            documentation: documentation,
            hasPublishedDocs: hasPublishedDocs,
            isUnresolvedIdentifier: isUnresolvedIdentifier,
            problemMessage: problemMessage,
            sharedName: sharedName);

  AnalyzerErrorCodeInfo.fromYaml(Map<Object, Object> yaml)
      : super.fromYaml(yaml);
}

abstract class ErrorCodeInfo {
  /// If present, a documentation comment that should be associated with the
  /// error in code generated output.
  final String comment;

  /// If the error code has an associated correctionMessage, the template for
  /// it.
  final String correctionMessage;

  /// If present, user-facing documentation for the error.
  final String documentation;

  /// `true` if diagnostics with this code have documentation for them that has
  /// been published.
  final bool hasPublishedDocs;

  /// Indicates whether this error is caused by an unresolved identifier.
  final bool isUnresolvedIdentifier;

  /// The problemMessage for the error code.
  final String problemMessage;

  /// If present, indicates that this error code has a special name for
  /// presentation to the user, that is potentially shared with other error
  /// codes.
  final String sharedName;

  /// If present, indicates that this error code has been renamed from
  /// [previousName] to its current name (or [sharedName]).
  final String previousName;

  ErrorCodeInfo(
      {this.comment,
      this.documentation,
      this.hasPublishedDocs = false,
      this.isUnresolvedIdentifier = false,
      this.sharedName,
      this.problemMessage,
      this.correctionMessage,
      this.previousName});

  /// Decodes an [ErrorCodeInfo] object from its YAML representation.
  ErrorCodeInfo.fromYaml(Map<Object, Object> yaml)
      : this(
            comment: yaml['comment'] as String,
            correctionMessage: yaml['correctionMessage'] as String,
            documentation: yaml['documentation'] as String,
            hasPublishedDocs: yaml['hasPublishedDocs'] as bool ?? false,
            isUnresolvedIdentifier:
                yaml['isUnresolvedIdentifier'] as bool ?? false,
            problemMessage: yaml['problemMessage'] as String,
            sharedName: yaml['sharedName'] as String,
            previousName: yaml['previousName'] as String);
}
