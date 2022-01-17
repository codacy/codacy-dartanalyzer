
**AVOID** shadowing type parameters.

**BAD:**
```dart
class A<T> {
  void fn<T>() {}
}
```

**GOOD:**
```dart
class A<T> {
  void fn<U>() {}
}
```

