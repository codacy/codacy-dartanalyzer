#### Description

The analyzer produces this diagnostic when the same lint rule is listed
more than once in the linter/rules section.

#### Example

The following code produces this diagnostic because the lint rule
`avoid_print` appears twice in the list of enabled rules:

```yaml
// %uri="analysis_options.yaml"
linter:
  rules:
    - avoid_print
    - [!avoid_print!]
```

#### Common fixes

Remove the duplicates:

```yaml
// %uri="analysis_options.yaml"
linter:
  rules:
    - avoid_print
```