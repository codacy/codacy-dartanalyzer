**DO** put asserts in initializer list for constructors with only asserts in
their body.

**GOOD:**
```dart
class A {
  A(int a) : assert(a != null);
}
```

**BAD:**
```dart
class A {
  A(int a) {
    assert(a != null);
  }
}
```

