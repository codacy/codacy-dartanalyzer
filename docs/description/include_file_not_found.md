#### Description

The analyzer produces this diagnostic when an `include` key in an analysis
options file specifies a URI that either can't be resolved or doesn't
exist.

#### Example

The following code produces this diagnostic because the URI refers to a
package that doesn't exist:

```yaml
// %uri="analysis_options.yaml"
include: package:lint/recommended.yaml
```

#### Common fixes

If the URI is incorrect, replace it with a correct URI:

```yaml
// %uri="analysis_options.yaml"
include: package:lints/recommended.yaml
```

If the URI is correct but the package isn't a dependency, add a
`dev_dependency` for the package to the `pubspec.yaml` file and run
`dart pub get` or `flutter pub get`.