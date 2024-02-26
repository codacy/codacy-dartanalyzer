#### Description

The analyzer produces this diagnostic when the value of the `assets` key
isn't a list.

#### Example

The following code produces this diagnostic because the value of the
`assets` key is a string when a list is expected:

```yaml
%uri="pubspec.yaml"
name: example
flutter:
  assets: [!assets/!]
```

#### Common fixes

Change the value of the asset list so that it's a list:

```yaml
%uri="pubspec.yaml"
name: example
flutter:
  assets:
    - assets/
```