#### Description

The analyzer produces this diagnostic when the content of a file that is
included into an analysis options file isn't valid YAML.

#### Example

Given a file named `shared.yaml` that contains:

```yaml
// %uri="shared.yaml"
analyzer:
  enable-experiment:
    - augmentations
  enable-experiment:
    - dot-shorthands
```

The following code produces this diagnostic because the included file
isn't valid YAML: the analyzer map contains duplicate `enable-experiment`
keys.

```yaml
// %uri="analysis_options.yaml"
include: [!shared.yaml!]
analyzer:
  enable-experiment:
    - enhanced-parts
```

#### Common fixes

If the file is intended to be included, then correct the included file to
be valid YAML:

```yaml
// %uri="shared.yaml"
analyzer:
  enable-experiment:
    - augmentations
    - dot-shorthands
```

If the file isn't intended to be included, then remove the `include` key:

```yaml
// %uri="analysis_options.yaml"
analyzer:
  enable-experiment:
    - enhanced-parts
```