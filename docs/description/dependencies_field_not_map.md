#### Description

The analyzer produces this diagnostic when the value of either the
`dependencies` or `dev_dependencies` key isn't a map.

#### Example

The following code produces this diagnostic because the value of the
top-level `dependencies` key is a list:

```yaml
%uri="pubspec.yaml"
name: example
dependencies:
  - meta
```

#### Common fixes

Use a map as the value of the `dependencies` key:

```yaml
%uri="pubspec.yaml"
name: example
dependencies:
  meta: ^1.0.2
```