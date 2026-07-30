#### Description

The analyzer produces this diagnostic when the contents of an analysis
options file isn't valid YAML.

#### Example

The following code produces this diagnostic because the `analyzer` section
has two `enable-experiment` keys:

```yaml
// %uri="analysis_options.yaml"
analyzer:
  enable-experiment:
    - augmentations
  [!enable-experiment!]:
    - dot-shorthands
```

#### Common fixes

Correct the file to be valid YAML:

```yaml
// %uri="analysis_options.yaml"
analyzer:
  enable-experiment:
    - augmentations
    - dot-shorthands
```