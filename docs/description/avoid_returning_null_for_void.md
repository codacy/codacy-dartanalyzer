**AVOID** returning null for void.

In a large variety of languages `void` as return type is used to indicate that
a function doesn't return anything. Dart allows returning `null` in functions
with `void` return type but it also allow using `return;` without specifying any
value. To have a consistent way you should not return `null` and only use an
empty return.

**BAD:**
```dart
void f1() {
  return null;
}
Future<void> f2() async {
  return null;
}
```

**GOOD:**
```dart
void f1() {
  return;
}
Future<void> f2() async {
  return;
}
```

