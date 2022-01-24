#### Description

The analyzer produces this diagnostic when an asset list contains a value
referencing a file that doesn't exist.

#### Example

Assuming that the file `doesNotExist.gif` doesn't exist, the following code
produces this diagnostic because it's listed as an asset:

```yaml
%uri="pubspec.yaml"
name: example
flutter:
  assets:
    - doesNotExist.gif
```

#### Common fixes

If the path is correct, then create a file at that path.

If the path isn't correct, then change the path to match the path of the
file containing the asset.