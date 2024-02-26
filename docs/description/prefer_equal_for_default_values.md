From the [style guide](https://dart.dev/guides/language/effective-dart/usage):

**DO** use `=` to separate a named parameter from its default value.

**BAD:**
```dart
m({a: 1})
```

**GOOD:**
```dart
m({a = 1})
```

