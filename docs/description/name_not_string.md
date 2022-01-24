#### Description

The analyzer produces this diagnostic when the top-level `name` key has a
value that isn't a string.

#### Example

The following code produces this diagnostic because the value following the
`name` key is a list:

```yaml
%uri="pubspec.yaml"
name:
  - example
```

#### Common fixes

Replace the value with a string:

```yaml
%uri="pubspec.yaml"
name: example
```