#### Description

The analyzer produces this diagnostic when the type of the expression
following the keyword `case` has an implementation of the `==` operator
other than the one in `Object`.

#### Example

The following code produces this diagnostic because the expression
following the keyword `case` (`C(0)`) has the type `C`, and the class `C`
overrides the `==` operator:

```dart
%language=2.18
class C {
  final int value;

  const C(this.value);

  bool operator ==(Object other) {
    return false;
  }
}

void f(C c) {
  switch (c) {
    case [!C(0)!]:
      break;
  }
}
```

#### Common fixes

If there isn't a strong reason not to do so, then rewrite the code to use
an if-else structure:

```dart
class C {
  final int value;

  const C(this.value);

  bool operator ==(Object other) {
    return false;
  }
}

void f(C c) {
  if (c == C(0)) {
    // ...
  }
}
```

If you can't rewrite the switch statement and the implementation of `==`
isn't necessary, then remove it:

```dart
%language=2.18
class C {
  final int value;

  const C(this.value);
}

void f(C c) {
  switch (c) {
    case C(0):
      break;
  }
}
```

If you can't rewrite the switch statement and you can't remove the
definition of `==`, then find some other value that can be used to control
the switch:

```dart
class C {
  final int value;

  const C(this.value);

  bool operator ==(Object other) {
    return false;
  }
}

void f(C c) {
  switch (c.value) {
    case 0:
      break;
  }
}
```