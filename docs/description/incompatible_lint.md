#### Description

The analyzer produces this diagnostic when two specified lint rules are
incompatible, such as when they enforce opposite styles.

#### Example

The following code produces this diagnostic because the rules
`prefer_single_quotes` and `prefer_double_quotes` are incompatible with
each other:

```yaml
// %uri="analysis_options.yaml"
linter:
  rules:
    - prefer_single_quotes
    - [!prefer_double_quotes!]
```

#### Common fixes

Remove all but one of the incompatible rules:

```yaml
// %uri="analysis_options.yaml"
linter:
  rules:
    - prefer_single_quotes
```