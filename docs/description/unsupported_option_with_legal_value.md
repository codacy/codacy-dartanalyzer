#### Description

The analyzer produces this diagnostic when an unsupported option is
specified.

#### Example

The following code produces this diagnostic because `experiments` isn't a
supported option:

```yaml
// %uri="analysis_options.yaml"
analyzer:
  [!experiments!]:
    - augmentations
```

#### Common fixes

If you intended to use a supported option, then replace the unsupported
option with the supported one:

```yaml
// %uri="analysis_options.yaml"
analyzer:
  enable-experiment:
    - augmentations
```

If no option exists for your intended purpose, then remove the unsupported
option:

```yaml
// %uri="analysis_options.yaml"
analyzer:
```