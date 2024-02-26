**AVOID** to check if type is double or int.

When compiled to JS, integer values are represented as floats. That can lead to
some unexpected behavior when using either `is` or `is!` where the type is
either `int` or `double`.

**BAD:**
```dart
f(num x) {
  if (x is double) {
    ...
  } else if (x is int) {
    ...
  }
}
```

**GOOD:**
```dart
f(dynamic x) {
  if (x is num) {
    ...
  } else {
    ...
  }
}
```

