
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/c19f9b18251e4dc5bce89b0a70d0bc70)](https://app.codacy.com/gh/codacy/codacy-dartanalyzer?utm_source=github.com&utm_medium=referral&utm_content=codacy/codacy-dartanalyzer&utm_campaign=Badge_Grade_Settings)
[![Build Status](https://circleci.com/gh/codacy/codacy-dartanalyzer.svg?style=shield&circle-token=:circle-token)](https://circleci.com/gh/codacy/codacy-dartanalyzer)

# Codacy Dart Analyzer

This is the docker engine we use at Codacy to have [Dart Analyzer](https://github.com/dart-lang/sdk/tree/master/pkg/analyzer_cli#dartanalyzer) support.
You can also create a docker to integrate the tool and language of your choice!
See the [codacy-engine-scala-seed](https://github.com/codacy/codacy-engine-scala-seed) repository for more information.

## Limitations

### Include not working on analysis_options.yaml

Currently, the tool does not support 'include' on the configuration files (analysis_options.yaml).
You can work around this by importing manually those specific rules, for example:

Instead of doing this
``` yaml
include: package:lints/recommended.yaml
```
Do this, go to official package lint repos ([lints](https://github.com/dart-lang/lints/blob/main/lib/recommended.yaml), [flutter](https://github.com/flutter/packages/blob/master/packages/flutter_lints/lib/flutter.yaml)*)
and copy-paste those rules into your analysis_options.yaml file, like so:

``` yaml
linter:
  rules:
    #Core
    - avoid_empty_else
    - avoid_relative_lib_imports
    - avoid_shadowing_type_parameters
    - avoid_types_as_parameter_names
    - await_only_futures
    - camel_case_extensions
    - camel_case_types
    - curly_braces_in_flow_control_structures
    - depend_on_referenced_packages
    - empty_catches
    - file_names
    - hash_and_equals
    - iterable_contains_unrelated_type
    - list_remove_unrelated_type
    - no_duplicate_case_values
    - non_constant_identifier_names
    - null_check_on_nullable_type_parameter
    - package_prefixed_library_names
    - prefer_generic_function_type_aliases
    - prefer_is_empty
    - prefer_is_not_empty
    - prefer_iterable_whereType
    - prefer_typing_uninitialized_variables
    - provide_deprecation_message
    - unnecessary_overrides
    - unrelated_type_equality_checks
    - valid_regexps
    - void_checks
    
    #Recommended 
    - avoid_print
    - avoid_unnecessary_containers
    - avoid_web_libraries_in_flutter
    - no_logic_in_create_state
    - prefer_const_constructors
    - prefer_const_constructors_in_immutables
    - prefer_const_declarations
    - prefer_const_literals_to_create_immutables
    - sized_box_for_whitespace
    - use_full_hex_values_for_flutter_colors
    - use_key_in_widget_constructors
```


*Flutter is not fully supported on this tool.


## Usage

You can create the docker by doing:

```bash
sbt graalvm-native-image:packageBin
docker build --build-arg TOOL_VERSION=$(cat .tool_version) -t codacy-dartanalyzer .
```

The docker is ran with the following command:

```bash
docker run -it -v $srcDir:/src  <DOCKER_NAME>:<DOCKER_VERSION>
```

## Test

For a faster development loop you can create a Docker image based on the JVM instead of creating a native-image:

```bash
sbt universal:stage
docker build --build-arg TOOL_VERSION=$(cat .tool_version) -t codacy-dartanalyzer -f Dockerfile.dev .
```

We use the [codacy-plugins-test](https://github.com/codacy/codacy-plugins-test) to test our external tools integration.
You can follow the instructions there to make sure your tool is working as expected.

## How to update the documentation

To generate the pattern.json and rules descriptions you must run a dart program from the project root.

```bash
dart run doc-generator/lib/generatedocs.dart
```

## What is Codacy?

[Codacy](https://www.codacy.com/) is an Automated Code Review Tool that monitors your technical debt, helps you improve your code quality, teaches best practices to your developers, and helps you save time in Code Reviews.

### Among Codacy’s features:

 - Identify new Static Analysis issues
 - Commit and Pull Request Analysis with GitHub, BitBucket/Stash, GitLab (and also direct git repositories)
 - Auto-comments on Commits and Pull Requests
 - Integrations with Slack, HipChat, Jira, YouTrack
 - Track issues in Code Style, Security, Error Proneness, Performance, Unused Code and other categories

Codacy also helps keep track of Code Coverage, Code Duplication, and Code Complexity.

Codacy supports PHP, Python, Ruby, Java, JavaScript, and Scala, among others.

### Free for Open Source

Codacy is free for Open Source projects.
