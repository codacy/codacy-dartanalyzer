#### Description

The analyzer produces this diagnostic when an asset value isn't a string
or a map.

#### Example

The following code produces this diagnostic because the asset value
is a list:

```yaml
%uri="pubspec.yaml"
name: example
flutter:
  assets:
    - [![one, two, three]!]
```

#### Common fixes

If you need to specify more than just the path to the asset, then replace
the value with a map with a `path` key (a valid POSIX-style file path):

```yaml
%uri="pubspec.yaml"
name: example
flutter:
  assets:
    - path: assets/image.gif
      flavors:
      - premium
```

If you only need to specify the path, then replace the value with the path
to the asset (a valid POSIX-style file path):

```yaml
%uri="pubspec.yaml"
name: example
flutter:
  assets:
    - assets/image.gif
```