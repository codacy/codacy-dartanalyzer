#### Description

The analyzer produces this diagnostic when a pattern assignment assigns a
value to anything other than a local variable. Patterns can't assign to
fields or top-level variables.

#### Example

If the code is cleaner when destructuring with a pattern, then rewrite the
code to assign the value to a local variable in a pattern declaration,
assigning the non-local variable separately:

```dart
class C {
  var x = 0;

  void f((int, int) r) {
    ([!x!], _) = r;
  }
}
```

#### Common fixes

If the code is cleaner when using a pattern assignment, then rewrite the
code to assign the value to a local variable, assigning the non-local
variable separately:

```dart
class C {
  var x = 0;

  void f((int, int) r) {
    var (a, _) = r;
    x = a;
  }
}
```

If the code is cleaner without using a pattern assignment, then rewrite
the code to not use a pattern assignment:

```dart
class C {
  var x = 0;

  void f((int, int) r) {
    x = r.$1;
  }
}
```