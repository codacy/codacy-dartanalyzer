
From the [style guide](https://dart.dev/guides/language/effective-dart/style):

**PREFER** using `///` for doc comments.

Although Dart supports two syntaxes of doc comments (`///` and `/**`), we
prefer using `///` for doc comments.

**GOOD:**
```dart
/// Parses a set of option strings. For each option:
///
/// * If it is `null`, then it is ignored.
/// * If it is a string, then [validate] is called on it.
/// * If it is any other type, it is *not* validated.
void parse(List options) {
  // ...
}
```

Within a doc comment, you can use markdown for formatting.

