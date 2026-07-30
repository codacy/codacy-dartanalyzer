#### Description

The analyzer produces this diagnostic when an analysis options file
attempts to enable a lint rule that is not defined.

#### Example

The following code produces this diagnostic because
`implementation_import` isn't a known lint:

```yaml
// %uri="analysis_options.yaml"
linter:
  rules:
    - annotate_overrides
    - [!implementation_import!]
```

#### Common fixes

If the name of the lint was mistyped, then correct the name.

```yaml
// %uri="analysis_options.yaml"
linter:
  rules:
    - annotate_overrides
    - implementation_imports
```

If there is no lint corresponding to the flagged entry, then remove the
undefined lint:

```yaml
// %uri="analysis_options.yaml"
linter:
  rules:
    - annotate_overrides
```