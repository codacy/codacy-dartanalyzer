**DO** use string buffers to compose strings.

In most cases, using a string buffer is preferred for composing strings due to
its improved performance.

**BAD:**
```dart
String foo() {
  final buffer = '';
  for (int i = 0; i < 10; i++) {
    buffer += 'a'; // LINT
  }
  return buffer;
}
```

**GOOD:**
```dart
String foo() {
  final buffer = StringBuffer();
  for (int i = 0; i < 10; i++) {
    buffer.write('a');
  }
  return buffer.toString();
}
```

