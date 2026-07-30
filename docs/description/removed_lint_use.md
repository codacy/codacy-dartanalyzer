#### Description

The analyzer produces this diagnostic when a lint that has been removed is
used in an analysis options file. Because the lint no longer exists,
referencing it will have no effect.

#### Example

Assuming that the lint `removed_lint` has been removed, the following
options file produces this diagnostic:

```yaml
%uri="analysis_options.yaml"
linter:
  rules:
  - always_put_required_named_parameters_first
  - [!removed_lint!]
```

#### Common fixes

Remove the reference to the lint code:

```yaml
%uri="analysis_options.yaml"
linter:
  rules:
  - always_put_required_named_parameters_first
```