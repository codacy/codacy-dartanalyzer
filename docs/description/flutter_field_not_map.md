#### Description

The analyzer produces this diagnostic when the value of the `flutter` key
isn't a map.

#### Example

The following code produces this diagnostic because the value of the
top-level `flutter` key is a string:

```yaml
%uri="pubspec.yaml"
name: example
flutter: true
```

#### Common fixes

If you need to specify Flutter-specific options, then change the value to
be a map:

```yaml
%uri="pubspec.yaml"
name: example
flutter:
  uses-material-design: true
```

If you don't need to specify Flutter-specific options, then remove the
`flutter` key:

```yaml
%uri="pubspec.yaml"
name: example
```