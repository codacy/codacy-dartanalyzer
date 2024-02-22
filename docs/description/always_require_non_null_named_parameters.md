**DO** specify `@required` on named parameters without a default value on which 
an `assert(param != null)` is done.

**GOOD:**
```dart
m1({@required a}) {
  assert(a != null);
}

m2({a: 1}) {
  assert(a != null);
}
```

**BAD:**
```dart
m1({a}) {
  assert(a != null);
}
```

NOTE: Only asserts at the start of the bodies will be taken into account.

