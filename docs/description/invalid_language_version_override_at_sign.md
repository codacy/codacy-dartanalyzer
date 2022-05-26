#### Description

The analyzer produces this diagnostic when a comment that appears to be an
attempt to specify a language version override doesn't conform to the
requirements for such a comment. For more information, see
[Per-library language version selection](https://dart.dev/guides/language/evolution#per-library-language-version-selection).

#### Example

The following code produces this diagnostic because the word `dart` must
be lowercase in such a comment and because there's no equal sign between
the word `dart` and the version number:

```dart
[!// @Dart 2.9!]
```

#### Common fixes

If the comment is intended to be a language version override, then change
the comment to follow the correct format:

```dart
// @dart = 2.9
```