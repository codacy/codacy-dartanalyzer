
**DO NOT** assign to void.

**BAD:**
```dart
class A<T> {
  T value;
  void test(T arg) { }
}

void main() {
  A<void> a = A<void>();
  a.value = 1; // LINT
  a.test(1); // LINT
}
```
