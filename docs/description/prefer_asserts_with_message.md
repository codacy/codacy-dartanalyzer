When assertions fail it's not always simple to understand why. Adding a message
to the `assert` helps the developer to understand why the AssertionError occurs.

**BAD:**
```dart
f(a) {
  assert(a != null);
}

class A {
  A(a) : assert(a != null);
}
```

**GOOD:**
```dart
f(a) {
  assert(a != null, 'a must not be null');
}

class A {
  A(a) : assert(a != null, 'a must not be null');
}
```

