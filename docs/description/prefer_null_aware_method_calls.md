
Instead of checking nullability of a function/method `f` before calling it you
can use `f?.call()`.

**BAD:**
```dart
if (f != null) f!();
```

**GOOD:**
```dart
f?.call();
```

