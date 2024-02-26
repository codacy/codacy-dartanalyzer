**DO** put asserts in initializer lists.

**GOOD:**
```dart
class A {
  A(int a) : assert(a != 0);
}
```

**BAD:**
```dart
class A {
  A(int a) {
    assert(a != 0);
  }
}
```
