#### Description

The analyzer produces this diagnostic when an asset map contains a
`path` value that isn't a string.

#### Example

The following code produces this diagnostic because the asset map
contains a `path` value which is a list:

```yaml
%uri="pubspec.yaml"
name: example
flutter:
  assets:
    - path: [![one, two, three]!]
      flavors:
      - premium
```

#### Common fixes

Change the `asset` map so that it contains a `path` value which is a
string (a valid POSIX-style file path):

```yaml
%uri="pubspec.yaml"
name: example
flutter:
  assets:
    - path: image.gif
      flavors:
      - premium
```