**DO** avoid `print` calls in production code.

**BAD:**
```dart
void f(int x) {
  print('debug: $x');
  ...
}
```
