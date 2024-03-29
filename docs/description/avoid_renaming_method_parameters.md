**DON'T** rename parameters of overridden methods.

Methods that override another method, but do not have their own documentation
comment, will inherit the overridden method's comment when `dart doc` produces
documentation. If the inherited method contains the name of the parameter (in
square brackets), then `dart doc` cannot link it correctly.

**BAD:**
```dart
abstract class A {
  m(a);
}

abstract class B extends A {
  m(b);
}
```

**GOOD:**
```dart
abstract class A {
  m(a);
}

abstract class B extends A {
  m(a);
}
```

