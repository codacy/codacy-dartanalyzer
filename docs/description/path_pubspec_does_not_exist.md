#### Description

The analyzer produces this diagnostic when a dependency has a `path` key
that references a directory that doesn't contain a `pubspec.yaml` file.

#### Example

Assuming that the directory `local_package` doesn't contain a file
`pubspec.yaml`, the following code produces this diagnostic because it's
listed as the path of a package:

```yaml
%uri="pubspec.yaml"
name: example
dependencies:
  local_package:
    path: [!local_package!]
```

#### Common fixes

If the path is intended to be the root of a package, then add a
`pubspec.yaml` file in the directory:

```yaml
%uri="pubspec.yaml"
name: local_package
```

If the path is wrong, then replace it with the correct path.