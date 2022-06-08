
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/c19f9b18251e4dc5bce89b0a70d0bc70)](https://app.codacy.com/gh/codacy/codacy-dartanalyzer?utm_source=github.com&utm_medium=referral&utm_content=codacy/codacy-dartanalyzer&utm_campaign=Badge_Grade_Settings)
[![Build Status](https://circleci.com/gh/codacy/codacy-dartanalyzer.svg?style=shield&circle-token=:circle-token)](https://circleci.com/gh/codacy/codacy-dartanalyzer)

# Codacy Dart Analyzer

This is the docker engine we use at Codacy to have [Dart Analyzer](https://github.com/dart-lang/sdk/tree/master/pkg/analyzer_cli#dartanalyzer) support.
You can also create a docker to integrate the tool and language of your choice!
See the [codacy-engine-scala-seed](https://github.com/codacy/codacy-engine-scala-seed) repository for more information.

## Supported packages lints on analysis_config.yaml files

* [lints](https://pub.dev/packages/lints)
* [flutter_lints](https://pub.dev/packages/flutter_lints)

### Adding supported packages 

To support new packages just add them on Dockerfile after the development context is created, like so:  
        `RUN dart pub add <package> --dev`

## How to bump the tool

To bump the tool just update the version at __.toolversion__ file and re-run the doc generation.

## Implementation Details

We currently are using `dartanalyzer` (deprecated) instead of `dart analyze` because `dartanalyzer` provides a way to specify
a configuration file `dartanalyzer --options <file>`, that way we can build the config file consistently with the patterns we want enabled vs disabled. 
When receiving patterns configurations via website/UI and if the configuration file (_analysis_options.yaml_) is present on the repo and a client want to use it, we can simply not pass a 
configuration file as parameter to `dartanalyzer --options <file>` and the `dartanalyzer` will pick automatically a file with name
_analysis_options.yaml_ as the configuration file.

There are some initial files created and copied at docker build moment to the docker image, these files are required to support the `include` on the _analysis_options.yaml_
files, [supported packages](#supported-packages-lints-on-analysis_configyaml-files).

### Future development/maintenance

Regarding the use of `dart analyze` it means that we will not be able to specify the config file via `--options` flag, because `dart analyze`
is meant to scan recursively different _analysis_options.yaml_, from the root to the packages and etc. With previous information, we might need 
to have a codacy _analysis_options.yaml_ on the root of the machine/docker (currently we have access limitations) where we run the tool where we can specify the 
patterns received by the website/UI, and THEN we might need (at current state of the tool `dart analyze`) to ignore all _analysis_options.yaml_ from the repo so the configs are not overridden.

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

test
