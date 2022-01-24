#### Description

The analyzer produces this diagnostic when an asset list contains a value
that isn't a string.

#### Example

The following code produces this diagnostic because the asset list contains
a map:

```yaml
%uri="pubspec.yaml"
name: example
flutter:
  assets:
    - image.gif: true
```

#### Common fixes

Change the asset list so that it only contains valid POSIX-style file
paths:

```yaml
%uri="pubspec.yaml"
name: example
flutter:
  assets:
    - image.gif
```