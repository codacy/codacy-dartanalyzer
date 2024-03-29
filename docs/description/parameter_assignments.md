**DON'T** assign new values to parameters of methods or functions.

Assigning new values to parameters is generally a bad practice unless an
operator such as `??=` is used.  Otherwise, arbitrarily reassigning parameters
is usually a mistake.

**BAD:**
```dart
void badFunction(int parameter) { // LINT
  parameter = 4;
}
```

**BAD:**
```dart
void badFunction(int required, {int optional: 42}) { // LINT
  optional ??= 8;
}
```

**BAD:**
```dart
void badFunctionPositional(int required, [int optional = 42]) { // LINT
  optional ??= 8;
}
```

**BAD:**
```dart
class A {
  void badMethod(int parameter) { // LINT
    parameter = 4;
  }
}
```

**GOOD:**
```dart
void ok(String parameter) {
  print(parameter);
}
```

**GOOD:**
```dart
void actuallyGood(int required, {int optional}) { // OK
  optional ??= ...;
}
```

**GOOD:**
```dart
void actuallyGoodPositional(int required, [int optional]) { // OK
  optional ??= ...;
}
```

**GOOD:**
```dart
class A {
  void ok(String parameter) {
    print(parameter);
  }
}
```

