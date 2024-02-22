From [Effective Dart](https://dart.dev/guides/language/effective-dart/usage#do-use-strings-in-part-of-directives):

**DO** use strings in `part of` directives.

**BAD:**

```dart
part of my_library;
```

**GOOD:**

```dart
part of '../../my_library.dart';
```

