Avoid returning an awaited expression when the expression type is assignable to
the function's return type.


**BAD:**
```dart
Future<int> future;
Future<int> f1() async => await future;
Future<int> f2() async {
  return await future;
}
```

**GOOD:**
```dart
Future<int> future;
Future<int> f1() => future;
Future<int> f2() {
  return future;
}
```

