
From the [style guide](https://dart.dev/guides/language/effective-dart/style/):

**DON'T** type annotate initializing formals.

If a constructor parameter is using `this.x` to initialize a field, then the
type of the parameter is understood to be the same type as the field.

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
  Point(int this.x, int this.y);
}
```

