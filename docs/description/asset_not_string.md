#### Description

The analyzer produces this diagnostic when an `assets` list contains a
value that isn't a string.

#### Example

The following code produces this diagnostic because the `assets` list
contains a map:

```yaml
%uri="pubspec.yaml"
name: example
flutter:
  assets:
    - [!image.gif: true!]
```

#### Common fixes

Change the `assets` list so that it only contains valid POSIX-style file
paths:

```yaml
%uri="pubspec.yaml"
name: example
flutter:
  assets:
    - assets/image.gif
```