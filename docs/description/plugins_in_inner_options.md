#### Description

The analyzer produces this diagnostic when analyzer plugins are defined in
an analysis options file other than the `analysis_options.yaml` at the
root of the package.

#### Example

Given an `analysis_options.yaml` file located in a subdirectory of the
package root, the following code produces this diagnostic because it
attempts to define plugins there:

```yaml
// %uri="inner/analysis_options.yaml"
[!plugins!]:
  one: ^1.0.0
```

#### Common fixes

Remove the list of plugins from the file.