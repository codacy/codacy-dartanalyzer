#### Description

The analyzer produces this diagnostic when an asset map is missing a
`path` value.

#### Example

The following code produces this diagnostic because the asset map
is missing a `path` value:

```yaml
%uri="pubspec.yaml"
name: example
flutter:
  assets:
    - flavors:
      - premium
```

#### Common fixes

Change the asset map so that it contains a `path` field with a string
value (a valid POSIX-style file path):

```yaml
%uri="pubspec.yaml"
name: example
flutter:
  assets:
    - path: assets/image.gif
      flavors:
      - premium
```