**PREFER** defining constructors instead of static methods to create instances.

In most cases, it makes more sense to use a named constructor rather than a
static method because it makes instantiation clearer.

**BAD:**
```dart
class Point {
  num x, y;
  Point(this.x, this.y);
  static Point polar(num theta, num radius) {
    return Point(radius * math.cos(theta),
        radius * math.sin(theta));
  }
}
```

**GOOD:**
```dart
class Point {
  num x, y;
  Point(this.x, this.y);
  Point.polar(num theta, num radius)
      : x = radius * math.cos(theta),
        y = radius * math.sin(theta);
}
```
