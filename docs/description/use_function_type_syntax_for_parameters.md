
Use generic function type syntax for parameters.

**BAD:**
```dart
Iterable<T> where(bool predicate(T element)) {}
```

**GOOD:**
```dart
Iterable<T> where(bool Function(T) predicate) {}
```

