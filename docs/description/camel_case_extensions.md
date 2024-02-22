From the [style guide](https://dart.dev/guides/language/effective-dart/style/):

**DO** name extensions using `UpperCamelCase`.

Extensions should capitalize the first letter of each word (including
the first word), and use no separators.

**GOOD:**
```dart
extension MyFancyList<T> on List<T> { 
  // ... 
}

extension SmartIterable<T> on Iterable<T> {
  // ...
}
```
