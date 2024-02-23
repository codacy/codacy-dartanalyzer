#### Description

The analyzer produces this diagnostic when a top-level `platforms`
field is specified, but its value is not a map with keys.
To learn more about specifying your package's supported platforms,
check out the [documentation on platform declarations](https://dart.dev/tools/pub/pubspec#platforms).

#### Example

The following `pubspec.yaml` produces this diagnostic because `platforms`
should be a map.

```yaml
%uri="pubspec.yaml"
name: example
platforms:
  [!- android
  - web
  - ios!]
```

#### Common fixes

If you can rely on automatic platform detection, then omit the
top-level `platforms` field.

```yaml
%uri="pubspec.yaml"
name: example
```

If you need to manually specify the list of supported platforms, then
write the `platforms` field as a map with platform names as keys.

```yaml
%uri="pubspec.yaml"
name: example
platforms:
  android:
  web:
  ios:
```