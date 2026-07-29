# Codacy Dart Analyzer

This is the docker engine we use at Codacy to have [Dart Analyzer](https://github.com/dart-lang/sdk/tree/master/pkg/analyzer) support.
You can also create a docker to integrate the tool and language of your choice!
See the [codacy-engine-scala-seed](https://github.com/codacy/codacy-engine-scala-seed) repository for more information.

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/c19f9b18251e4dc5bce89b0a70d0bc70)](https://app.codacy.com/gh/codacy/codacy-dartanalyzer?utm_source=github.com&utm_medium=referral&utm_content=codacy/codacy-dartanalyzer&utm_campaign=Badge_Grade_Settings)
[![Build Status](https://circleci.com/gh/codacy/codacy-dartanalyzer.svg?style=svg)](https://circleci.com/gh/codacy/codacy-dartanalyzer)

## Supported packages lints on analysis_config.yaml files

*   [lints](https://pub.dev/packages/lints)
*   [flutter_lints](https://pub.dev/packages/flutter_lints)

### Adding supported packages 

To support new packages just add them on Dockerfile after the development context is created, like so:
```dockerfile
  RUN dart pub add <package> --dev
```

## How to bump the tool

-   Update the version at `.tool_version` file with the new SDK version.
-   Re-run the [doc generation](#how-to-update-the-documentation).

## Implementation Details

We use `dart analyze` command, which performs static analysis on dart source code. It works by having an `analysis_options.yaml` file, which specifies all the necessary rules for analysis. This file has the following structure:
```yaml
include: package:lints/recommended.yaml

analyzer:
  exclude: [build/**]
  language:
    strict-casts: true
    strict-raw-types: true

linter:
  rules:
    - cancel_subscriptions
```

The example above illustrates the most common entries you will have to specify:
-   The include operation is used to import options from the specified URL. __You can include at most one file.__
-   The analyzer entry customizes static analysis, where you can activate or de-activate specific rules, ignore files, etc.
-   The linter entry specifies linting rules.

### Analysis Option File Precedence
You can have multiple `analysis_options.yaml` files in a project. However, there are some rules that apply when you do so.
The analyzer will always use the first analysis_options file it finds when searching through the file hierarchy. 
The following image explains the rules used for the options files: 

<figure>
  <img src="https://dart.dev/assets/img/guides/analysis-options-directory-structure.png" style="background: white">
  <figcaption>Fig.1 - Options files example (taken from the <a href="https://dart.dev/guides/language/analysis-options">official documentation</a>)</figcaption>
</figure>

In the case demonstrated above, the analyzer uses file `#1` to analyze the code in `my_other_package` and `my_other_other_package`, and file `#2` to analyze the code in `my_package`.
This implies that any `analysis_options.yaml` files specified in the hierarchy will override the users' provided analysis configurations.

When building the docker image, we the necessary files required to support the `include` operation on the `analysis_options.yaml` files [supported packages](#supported-packages-lints-on-analysis_configyaml-files).

### Output formatting
By default, dart outputs the analysis results in a human-readable format. However, there is an optional argument `format` that makes it easier to parse.
We use `--format=machine` to provide the best format for parsing the results by Codacy.

## Usage

You can create the docker image by executing the following commands:

```bash
sbt graalvm-native-image:packageBin
docker build --build-arg TOOL_VERSION=$(cat .tool_version) -t codacy-dartanalyzer .
```

To run the docker image, you can use the following command:

```bash
docker run -it -v $srcDir:/src  <DOCKER_NAME>:<DOCKER_VERSION>
```

## Test

For a faster development loop, you can create a JVM-based Docker image instead of creating a native-image:

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

## Agent Playbook: Updating This Repository End-to-End

This section is written for an AI coding agent (or a human) tasked with updating this repo — most commonly bumping the wrapped Dart SDK / `dart analyze` version, but also orb / base-image / dependency bumps. Follow it top to bottom; it tells you what to change, how to regenerate derived files, how to test locally, and how to interpret CI so you can iterate on failures without guessing.

### 1. What this repository is

This is a **Codacy engine**: a thin Scala wrapper (built on `codacy-engine-scala-seed`, see `build.sbt`) that shells out to the `dart analyze` command and packages it as a Docker image Codacy's platform runs against a customer's source code. There is no Scala/JVM re-implementation of the linter itself — the actual analysis is `dart analyze --format=machine` running inside the container's Dart SDK, and the Scala code parses that output.

The `docs/` directory is not just documentation — it is **machine-consumed configuration**:

- `docs/patterns.json` — the full list of `dart analyze` lint rules ("patterns") Codacy knows about, their level/category, and which are enabled by default. Generated file, do not hand-edit.
- `docs/patterns_type.json` — maps each pattern id to `lint` or `error` (i.e. whether it came from the linter package rules or from the analyzer's own error catalog). Generated file, do not hand-edit.
- `docs/description/description.json` + `docs/description/*.md` — human-readable titles/descriptions per pattern, used in the Codacy UI. Generated files, do not hand-edit.
- `docs/dartanalyzer/pubspec.yaml`, `pubspec.lock`, `.packages`, `analysis_options.yaml` — an initial Dart project skeleton (pinned to the SDK version) copied into the Docker image so `analysis_options.yaml` `include:` directives (e.g. `package:lints/recommended.yaml`) can resolve. `pubspec.yaml`'s `environment.sdk` is regenerated automatically from `.tool_version` — do not hand-edit.
- `docs/tests/*` and `docs/multiple-tests/*` — fixtures (`analysis_options.yaml` + sample `src` files + expected `results.xml`/`patterns.xml`) used by `codacy-plugins-test` to validate the engine actually produces the results it claims to for real code samples.
- `docs/tool-description.md` — short blurb about the tool, hand-maintained.

All the generated artifacts above come from **`doc-generator/lib/generatedocs.dart`** (a separate small Dart package rooted at `doc-generator/`, with its own `doc-generator/pubspec.yaml`). It reads `.tool_version`, registers the `linter` package's lint rules to build `patterns.json`/`description.json`/per-rule `.md` files, and additionally fetches `https://raw.githubusercontent.com/dart-lang/sdk/<tool_version>/pkg/analyzer/messages.yaml` over the network to pull in the analyzer's own error-code patterns (disabled by default). This means the generator needs **network access** and a Dart SDK matching (or compatible with) the target version to run.

### 2. Files that encode versions — check all of these on every update

| File | What it controls | What to check |
|---|---|---|
| `.tool_version` | The exact Dart SDK version bundled (used as the Docker base image tag, passed to `docker build --build-arg TOOL_VERSION=...`, and read by the doc generator to know which SDK/lint rules to document) | Bump to the target version (no trailing newline, matching existing style). |
| `doc-generator/pubspec.yaml` → `environment.sdk` and `dependencies` (`analyzer`, `linter`, `http`, `yaml`) | The Dart SDK constraint and package versions used to *run the doc generator itself* | Widen/bump the SDK constraint to cover the new `.tool_version`, and bump `analyzer`/`linter` if the target Dart version needs newer packages (see commit `62a9a5c` for a real example of bumping `analyzer`/`linter`/`http` together with the SDK). |
| `docs/dartanalyzer/pubspec.yaml` → `environment.sdk` | The SDK version used when resolving `analysis_options.yaml` includes inside the Docker image | Do not hand-edit — it is regenerated by `dart run doc-generator/lib/generatedocs.dart` from `.tool_version`. |
| `.circleci/config.yml` → `codacy/base` orb | Shared CircleCI steps (checkout, sbt build, publish, tag) | Check the latest published version. |
| `.circleci/config.yml` → `codacy/plugins-test` orb | Runs `codacy-plugins-test` in CI | Same as above. |
| `build.sbt` → `codacy-engine-scala-seed` version | The Scala engine framework this wrapper is built on | Only bump if scoped by the task; unrelated to the Dart SDK version. |
| `Dockerfile` / `Dockerfile.dev` → `FROM dart:${TOOL_VERSION}` | Runtime base image | Driven by `.tool_version` via `--build-arg`; no separate edit needed unless changing the base image distribution itself. |

### 3. Step-by-step update procedure

1. **Bump `.tool_version`** to the target Dart SDK version.
2. **Bump `doc-generator/pubspec.yaml`** (`environment.sdk` constraint, and `analyzer`/`linter`/`http`/`yaml` dependency versions as needed) so the generator itself can run under the new SDK and see the new lint rule set.
3. **Regenerate the docs**: from the project root, run
   ```bash
   dart run doc-generator/lib/generatedocs.dart
   ```
   This deletes and rewrites `docs/description/`, `docs/patterns.json`, `docs/patterns_type.json`, and `docs/dartanalyzer/pubspec.yaml`/`pubspec.lock`/`.packages`/`analysis_options.yaml`. Review the diff for new/removed/renamed patterns and make sure no fixture in `docs/tests`/`docs/multiple-tests` now refers to a renamed or removed pattern.
4. **Compile and format** the Scala wrapper:
   ```bash
   sbt -Dsbt.io.jdktimestamps=true scalafmtCheckAll
   ```
5. **Build the Docker image** (native-image, matches CI):
   ```bash
   sbt graalvm-native-image:packageBin
   docker build --build-arg TOOL_VERSION=$(cat .tool_version) -t codacy-dartanalyzer .
   ```
   For a faster local loop, build the JVM-based dev image instead:
   ```bash
   sbt universal:stage
   docker build --build-arg TOOL_VERSION=$(cat .tool_version) -t codacy-dartanalyzer -f Dockerfile.dev .
   ```
6. **Run `codacy-plugins-test` locally** before pushing — clone https://github.com/codacy/codacy-plugins-test and run it against your local image tag, per that repo's instructions.
7. **Iterate on failures**, re-running only the relevant test after each fix.
8. **Commit** the version bump(s) together with the regenerated `docs/` files in one change.
9. **Push and open a PR.**
10. **Poll the PR's real CI checks until they all pass — local validation is NOT the finish line.** After every push, run `gh pr checks <pr-url>` and keep re-polling (short sleep while any check is `pending`) until all checks finish. If a check fails, fetch its actual log (don't guess), find the true root cause, fix it, push again (never `--no-verify`, never force-push), and re-poll. Repeat until every check is green. **The CI environment's toolchain can differ from your local one**, so a clean local run does not guarantee CI passes. Only stop iterating when every check passes, or you hit a genuine product/infra decision that needs a human.

### 4. Common failure modes and fixes

| Symptom | Cause | Fix |
|---|---|---|
| Doc generator fails to fetch analyzer error patterns | `https://raw.githubusercontent.com/dart-lang/sdk/<tool_version>/pkg/analyzer/messages.yaml` doesn't exist for that tag/branch (e.g. version string mismatch) | Confirm `.tool_version` matches an actual `dart-lang/sdk` tag/branch name before regenerating docs. |
| `codacy-plugins-test` fails on a fixture in `docs/tests`/`docs/multiple-tests` | A lint rule was renamed or removed upstream and the fixture still asserts the old pattern id | Update or remove the affected fixture's `patterns.xml`/`results.xml` to match the regenerated `docs/patterns.json`. |

### 5. Definition of done

- `.tool_version` and `doc-generator/pubspec.yaml` (SDK constraint + dependency versions) bumped consistently.
- `docs/patterns.json`, `docs/patterns_type.json`, `docs/description/*`, and `docs/dartanalyzer/*` regenerated via `dart run doc-generator/lib/generatedocs.dart` and committed.
- Any fixtures in `docs/tests`/`docs/multiple-tests` that reference changed patterns updated.
- `sbt scalafmtCheckAll` passes and the Docker image builds successfully (native-image and/or dev image).
- `codacy-plugins-test` commands all pass locally against the freshly built image.
- **After pushing and opening/updating the PR, every CI check on it is green.** Poll `gh pr checks <pr-url>` and iterate on any failure until all pass.

---

## What is Codacy?

[Codacy](https://www.codacy.com/) is an Automated Code Review Tool that monitors your technical debt, helps you improve your code quality, teaches best practices to your developers, and helps you save time in Code Reviews.

### Among Codacy’s features:

 -   Identify new Static Analysis issues
 -   Commit and Pull Request Analysis with GitHub, BitBucket/Stash, GitLab (and also direct git repositories)
 -   Auto-comments on Commits and Pull Requests
 -   Integrations with Slack, HipChat, Jira, YouTrack
 -   Track issues in Code Style, Security, Error Proneness, Performance, Unused Code and other categories

Codacy also helps keep track of Code Coverage, Code Duplication, and Code Complexity.

Codacy supports PHP, Python, Ruby, Java, JavaScript, Dart, and Scala, among other languages.

### Free for Open Source

Codacy is free for Open Source projects.
