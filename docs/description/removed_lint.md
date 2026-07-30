#### Description

The analyzer produces this diagnostic when an analysis options file
enables a lint that is no longer supported.

#### Example

The following code produces this diagnostic because the lint
`always_declare_return_types` is no longer supported:

```yaml
// %uri="analysis_options.yaml"
linter:
  rules:
    - [!always_declare_return_types!]
    - annotate_overrides
```

#### Common fixes

Remove the reference to the removed lint rule:

```yaml
// %uri="analysis_options.yaml"
linter:
  rules:
    - annotate_overrides
```