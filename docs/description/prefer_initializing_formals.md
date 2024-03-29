**DO** use initializing formals when possible.

Using initializing formals when possible makes your code more terse.

**BAD:**
```dart
class Point {
  num x, y;
  Point(num x, num y) {
    this.x = x;
    this.y = y;
  }
}
```

**GOOD:**
```dart
class Point {
  num x, y;
  Point(this.x, this.y);
}
```

**BAD:**
```dart
class Point {
  num x, y;
  Point({num x, num y}) {
    this.x = x;
    this.y = y;
  }
}
```

**GOOD:**
```dart
class Point {
  num x, y;
  Point({this.x, this.y});
}
```

**NOTE**
This rule will not generate a lint for named parameters unless the parameter
name and the field name are the same. The reason for this is that resolving
such a lint would require either renaming the field or renaming the parameter,
and both of those actions would potentially be a breaking change. For example,
the following will not generate a lint:

```dart
class Point {
  bool isEnabled;
  Point({bool enabled}) {
    this.isEnabled = enabled; // OK
  }
}
```

**NOTE**
Also note that it is possible to enforce a type that is stricter than the
initialized field with an initializing formal parameter.  In the following
example the unnamed `Bid` constructor requires a non-null `int` despite
`amount` being declared nullable (`int?`).

```dart
class Bid {
 final int? amount;
 Bid(int this.amount);
 Bid.pass() : amount = null;
}
```
