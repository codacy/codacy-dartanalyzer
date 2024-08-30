#### Description

The analyzer produces this diagnostic when a `workspace` list contains a
value that isn't a string.

#### Example

The following code produces this diagnostic because the `workspace` list
contains a map:

```yaml
%uri="pubspec.yaml"
name: example
workspace:
    - [!image.gif: true!]
```

#### Common fixes

Change the `workspace` list so that it only contains valid POSIX-style directory
paths:

```yaml
%uri="pubspec.yaml"
name: example
workspace:
    - pkg/package_1
    - pkg/package_2
```