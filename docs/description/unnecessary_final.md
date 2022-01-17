**DON'T** use `final` for local variables.

`var` is shorter, and `final` does not change the meaning of the code.

**BAD:**
```dart
void badMethod() {
  final label = 'Final or var?';
  for (final char in ['v', 'a', 'r']) {
    print(char);
  }
}
```

**GOOD:**
```dart
void goodMethod() {
  var label = 'Final or var?';
  for (var char in ['v', 'a', 'r']) {
    print(char);
  }
}
```
