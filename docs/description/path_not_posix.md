#### Description

The analyzer produces this diagnostic when a dependency has a `path` key
whose value is a string, but isn't a POSIX-style path.

#### Example

The following code produces this diagnostic because the path following the
`path` key is a Windows path:

```yaml
%uri="pubspec.yaml"
name: example
dependencies:
  local_package:
    path: E:\local_package
```

#### Common fixes

Convert the path to a POSIX path.