
**PREFER** `iterable.whereType<T>()` over `iterable.where((e) => e is T)`.

**BAD:**
```dart
iterable.where((e) => e is MyClass)
```

**GOOD:**
```dart
iterable.whereType<MyClass>()
```

