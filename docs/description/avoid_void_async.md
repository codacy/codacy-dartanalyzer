
**DO** mark async functions to return Future<void>.

When declaring an async method or function which does not return a value,
declare that it returns Future<void> and not just void.

**BAD:**
```dart
void f() async {}
void f2() async => null;
```

**GOOD:**
```dart
Future<void> f() async {}
Future<void> f2() async => null;
```

