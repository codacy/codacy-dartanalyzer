#### Description

The analyzer produces this diagnostic when an analysis options file,
directly or indirectly, includes itself.

#### Examples

The following code produces this diagnostic because the file directly
includes itself:

```yaml
// %uri="analysis_options.yaml"
include: [!analysis_options.yaml!]
```

Given a file named `shared_options.yaml` that contains:

```yaml
// %uri="shared_options.yaml"
include: analysis_options.yaml
```

The following code produces this diagnostic because the file indirectly
includes itself:

```yaml
// %uri="analysis_options.yaml"
include: [!shared_options.yaml!]
```

#### Common fixes

Change at least one of the files in order to break the circularity.