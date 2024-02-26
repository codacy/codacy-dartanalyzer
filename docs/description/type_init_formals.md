From the [style guide](https://dart.dev/guides/language/effective-dart/style/):

**DON'T** type annotate initializing formals.

If a constructor parameter is using `this.x` to initialize a field, then the
type of the parameter is understood to be the same type as the field. If a 
a constructor parameter is using `super.x` to forward to a super constructor,
then the type of the parameter is understood to be the same as the super
constructor parameter.

Type annotating an initializing formal with a different type than that of the
field is OK.

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

**GOOD:**
```dart
class A {
  int a;
  A(this.a);
}

class B extends A {
  B(super.a);
}
```

**BAD:**
```dart
class A {
  int a;
  A(this.a);
}

class B extends A {
  B(int super.a);
}
```
