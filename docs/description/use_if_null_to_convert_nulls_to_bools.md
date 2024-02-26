From [Effective Dart](https://dart.dev/guides/language/effective-dart/usage#prefer-using--to-convert-null-to-a-boolean-value):

Use if-null operators to convert nulls to bools.

**BAD:**
```dart
if (nullableBool == true) {
}
if (nullableBool != false) {
}
```

**GOOD:**
```dart
if (nullableBool ?? false) {
}
if (nullableBool ?? true) {
}
```

