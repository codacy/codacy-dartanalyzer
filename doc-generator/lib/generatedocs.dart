import 'dart:io';

import 'package:analyzer/src/lint/registry.dart';
import 'package:linter/src/analyzer.dart';
import 'package:linter/src/rules.dart';

import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:yaml/yaml.dart';

void main() {
  File dartanalyzerVersionFile = new File('.tool_version');

  final sdkVersion = dartanalyzerVersionFile.readAsStringSync();

  final encoder = new JsonEncoder.withIndent("  ");

  final String docsDescriptionDirPath = "docs/description";
  final Directory docsDescriptionDir = new Directory(docsDescriptionDirPath);
  final File descriptionFile = new File("docs/description/description.json");
  final File patternsFile = new File("docs/patterns.json");
  final File patternsTypeFile = new File('docs/patterns_type.json');

  //clear existing docs
  if (docsDescriptionDir.existsSync()) {
    docsDescriptionDir.deleteSync(recursive: true);
  }
  if (patternsFile.existsSync()) {
    patternsFile.deleteSync(recursive: true);
  }

  //create description dir
  docsDescriptionDir.createSync(recursive: true);

  if (patternsTypeFile.existsSync()) {
    patternsTypeFile.deleteSync();
  }

  registerLintRules();

  Map<String, String> patternsType = {};

  Iterable<LintRule> enabledLintRules = Registry.ruleRegistry.rules;

  Set<PatternSpec> patterns = {};
  Set<Description> descriptions = {};

  enabledLintRules.forEach((rule) {
    var pattern = PatternSpec(
        patternId: rule.name,
        level: rule.group.name == "errors" ? "Error" : "Info",
        category: rule.group.name == "style" ? "CodeStyle" : "ErrorProne",
        enabled: true);

    patternsType[pattern.patternId] = 'lint';

    patterns.add(pattern);

    var splited = rule.name.split("_").join(" ");
    var title = splited[0].toUpperCase() + splited.substring(1);

    descriptions.add(Description(
        patternId: rule.name, title: title, description: rule.description));

    File(docsDescriptionDirPath + '/' + rule.name + ".md").writeAsStringSync(
      rule.details,
    );
  });

  //Registry.ruleRegistry.rules does not have rules, so this was the solution
  // to get all the missing rules with md documentation
  // final String sdkDir = "tempDartSdk";
  // new Directory(sdkDir).createSync();

  // Process.runSync('git', [
  //   'clone',
  //   '--depth',
  //   '1',
  //   '--branch',
  //   sdkVersion,
  //   'https://github.com/dart-lang/sdk.git',
  //   sdkDir
  // ]);

  void processErrorPatterns() async {
    final url =
        'https://raw.githubusercontent.com/dart-lang/sdk/${sdkVersion}/pkg/analyzer/messages.yaml';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      print('Failed to load file');
      return;
    }

    final String content = response.body;
    final YamlMap yaml = loadYaml(content);
    final Map<String, Map<String, AnalyzerErrorCodeInfo>> errorPatterns =
        decodeAnalyzerMessagesYaml(yaml);

    errorPatterns.forEach((key, group) {
      group.forEach((key, value) {
        String patternId = key.toLowerCase();

        var pattern = PatternSpec(
            patternId: patternId,
            level: 'Warning',
            category: 'ErrorProne',
            enabled: false);

        patternsType[pattern.patternId] = 'error';
        patterns.add(pattern);

        var splited = patternId.split("_").join(" ");
        var title = splited[0].toUpperCase() + splited.substring(1);

        descriptions.add(
            Description(patternId: patternId, title: title, description: ''));

        if (value.documentation != null) {
          File(docsDescriptionDirPath + '/' + patternId + ".md")
              .writeAsString(value.documentation!);
        }
      });
    });
  }

  ;

  processErrorPatterns();

  descriptionFile.writeAsStringSync(encoder.convert(descriptions.toList()));

  patternsFile.writeAsStringSync(encoder.convert(PatternsFile(
      name: "dartanalyzer", version: sdkVersion, patterns: patterns)));

  patternsTypeFile.writeAsStringSync(encoder.convert(patternsType));

  createInitialPubspecFiles(sdkVersion);

  print("Happy ending: Docs generated for SDK version $sdkVersion");
}

// Models

class PatternsFile {
  final String name;
  final String version;
  final Set<PatternSpec> patterns;

  PatternsFile(
      {required this.name, required this.patterns, required this.version});

  Map<String, dynamic> toJson() =>
      {'name': name, 'version': version, 'patterns': patterns.toList()};
}

class Description {
  final String patternId;
  final String title;
  final String description;

  Description(
      {required this.patternId,
      required this.title,
      required this.description});

  Map<String, dynamic> toJson() =>
      {'patternId': patternId, 'title': title, 'description': description};
}

//@JsonSerializable()
class PatternSpec {
  final String patternId;
  final String level;
  final String category;
  //parameters: ParameterSpec[]
  final bool enabled;

  PatternSpec(
      {required this.patternId,
      required this.level,
      required this.category,
      required this.enabled});

  Map<String, dynamic> toJson() => {
        'patternId': patternId,
        'level': level,
        'category': category,
        'enabled': enabled
      };
}

//Dart Sdk

/// Decodes a YAML object (obtained from `pkg/analyzer/messages.yaml`) into a
/// two-level map of [ErrorCodeInfo], indexed first by class name and then by
/// error name.
Map<String, Map<String, AnalyzerErrorCodeInfo>> decodeAnalyzerMessagesYaml(
    YamlMap yaml) {
  Never problem(String message) {
    throw 'Problem in pkg/analyzer/messages.yaml: $message';
  }

  var result = <String, Map<String, AnalyzerErrorCodeInfo>>{};

  (yaml).forEach((key, value) {
    var className = key;
    if (className is! String) {
      problem('non-string class key ${json.encode(className)}');
    }
    var classValue = value;
    if (classValue is! YamlMap) {
      print(classValue);
      problem('value associated with class key $className is not a map');
    }
    (classValue).forEach((key, value) {
      var errorName = key;
      if (errorName is! String) {
        problem('in class $className, non-string error key '
            '${json.encode(errorName)}');
      }
      var errorValue = value;
      if (errorValue is! YamlMap) {
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
      {comment,
      correctionMessage,
      documentation,
      hasPublishedDocs,
      isUnresolvedIdentifier,
      problemMessage,
      sharedName})
      : super(
            comment: comment,
            correctionMessage: correctionMessage,
            documentation: documentation,
            hasPublishedDocs: hasPublishedDocs,
            isUnresolvedIdentifier: isUnresolvedIdentifier,
            problemMessage: problemMessage,
            sharedName: sharedName);

  AnalyzerErrorCodeInfo.fromYaml(YamlMap yaml) : super.fromYaml(yaml);
}

abstract class ErrorCodeInfo {
  /// If present, a documentation comment that should be associated with the
  /// error in code generated output.
  final String? comment;

  /// If the error code has an associated correctionMessage, the template for
  /// it.
  final String? correctionMessage;

  /// If present, user-facing documentation for the error.
  final String? documentation;

  /// `true` if diagnostics with this code have documentation for them that has
  /// been published.
  final bool? hasPublishedDocs;

  /// Indicates whether this error is caused by an unresolved identifier.
  final bool? isUnresolvedIdentifier;

  /// The problemMessage for the error code.
  final String? problemMessage;

  /// If present, indicates that this error code has a special name for
  /// presentation to the user, that is potentially shared with other error
  /// codes.
  final String? sharedName;

  /// If present, indicates that this error code has been renamed from
  /// [previousName] to its current name (or [sharedName]).
  final String? previousName;

  ErrorCodeInfo(
      {this.comment,
      this.documentation,
      this.hasPublishedDocs,
      this.isUnresolvedIdentifier,
      this.sharedName,
      this.problemMessage,
      this.correctionMessage,
      this.previousName});

  /// Decodes an [ErrorCodeInfo] object from its YAML representation.
  ErrorCodeInfo.fromYaml(YamlMap yaml)
      : this(
            comment: (yaml['comment'] as String?)?.trim(),
            correctionMessage: (yaml['correctionMessage'] as String?)?.trim(),
            documentation: (yaml['documentation'] as String?)?.trim(),
            hasPublishedDocs: yaml['hasPublishedDocs'] as bool? ?? false,
            isUnresolvedIdentifier:
                yaml['isUnresolvedIdentifier'] as bool? ?? false,
            problemMessage: (yaml['problemMessage'] as String?)?.trim(),
            sharedName: (yaml['sharedName'] as String?)?.trim(),
            previousName: (yaml['previousName'] as String?)?.trim());
}

void createInitialPubspecFiles(String sdkVersion) {
  //Create necessary initial dart files (to support includes)

  final dartanalyzerPathStr = "docs/dartanalyzer";
  final Directory dartanalyzerDir = new Directory(dartanalyzerPathStr);
  if (dartanalyzerDir.existsSync()) {
    dartanalyzerDir.deleteSync(recursive: true);
    dartanalyzerDir.createSync(recursive: true);
  } else {
    dartanalyzerDir.createSync(recursive: true);
  }

  /*
  This is the initial pubspec.yaml file for dart, it contains some ordinary/required fields
  and the sdkVersion which should be the same as the one used on the tool and the pattern generation.

  name: "dartanalyzer"
  version: "0.0.1"
  description: "Initial pubspec.yaml to install supported includes on analysis_options.yaml files"
  environment:
    sdk: "2.16.1"
   */

  final writer = YamlWriter();
  String pubspec = writer.write({
        'name': 'dartanalyzer',
        'version': '0.0.1',
        'description':
            'Initial pubspec.yaml to install supported includes on analysis_options.yaml files',
        'environment': {
          'sdk': sdkVersion,
        },
      }) +
      "\n";

  File file = File(dartanalyzerPathStr + '/pubspec.yaml');
  file.createSync();
  file.writeAsStringSync(pubspec);

  File(dartanalyzerPathStr + '/pubspec.lock').createSync();
  File(dartanalyzerPathStr + '/.packages').createSync();
  File(dartanalyzerPathStr + '/analysis_options.yaml').createSync();
}

class YamlWriter {
  /// The amount of spaces for each level.
  final int spaces;

  /// Initialize the writer with the amount of [spaces] per level.
  YamlWriter({
    this.spaces = 2,
  });

  /// Write a dart structure to a YAML string. [yaml] should be a [Map] or [List].
  String write(dynamic yaml) {
    return _writeInternal(yaml).trim();
  }

  /// Write a dart structure to a YAML string. [yaml] should be a [Map] or [List].
  String _writeInternal(dynamic yaml, {int indent = 0}) {
    String str = '';

    if (yaml is List) {
      str += _writeList(yaml, indent: indent);
    } else if (yaml is Map) {
      str += _writeMap(yaml, indent: indent);
    } else if (yaml is String) {
      str += "\"${yaml.replaceAll("\"", "\\\"")}\"";
    } else {
      str += yaml.toString();
    }

    return str;
  }

  /// Write a list to a YAML string.
  /// Pass the list in as [yaml] and indent it to the [indent] level.
  String _writeList(List yaml, {int indent = 0}) {
    String str = '\n';

    for (var item in yaml) {
      str +=
          "${_indent(indent)}- ${_writeInternal(item, indent: indent + 1)}\n";
    }

    return str;
  }

  /// Write a map to a YAML string.
  /// Pass the map in as [yaml] and indent it to the [indent] level.
  String _writeMap(Map yaml, {int indent = 0}) {
    String str = '\n';

    for (var key in yaml.keys) {
      var value = yaml[key];
      str +=
          "${_indent(indent)}${key.toString()}: ${_writeInternal(value, indent: indent + 1)}\n";
    }

    return str;
  }

  /// Create an indented string for the level with the spaces config.
  /// [indent] is the level of indent whereas [spaces] is the
  /// amount of spaces that the string should be indented by.
  String _indent(int indent) {
    return ''.padLeft(indent * spaces, ' ');
  }
}
