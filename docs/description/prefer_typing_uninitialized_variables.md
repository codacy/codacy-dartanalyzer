**PREFER** specifying a type annotation for uninitialized variables and fields.

Forgoing type annotations for uninitialized variables is a bad practice because
you may accidentally assign them to a type that you didn't originally intend to.

**BAD:**
```dart
class BadClass {
  static var bar; // LINT
  var foo; // LINT

  void method() {
    var bar; // LINT
    bar = 5;
    print(bar);
  }
}
```

**BAD:**
```dart
void aFunction() {
  var bar; // LINT
  bar = 5;
  ...
}
```

**GOOD:**
```dart
class GoodClass {
  static var bar = 7;
  var foo = 42;
  int baz; // OK

  void method() {
    int baz;
    var bar = 5;
    ...
  }
}
```

