
From the [style guide](https://dart.dev/guides/language/effective-dart/style/):

**DO** use `;` instead of `{}` for empty constructor bodies.

In Dart, a constructor with an empty body can be terminated with just a
semicolon.  This is required for const constructors.  For consistency and
brevity, other constructors should also do this.

**GOOD:**
```dart
class Point {
  int x, y;
  Point(this.x, this.y);
}
```

**BAD:**
```dart
class Point {
  int x, y;
  Point(this.x, this.y) {}
}
```

