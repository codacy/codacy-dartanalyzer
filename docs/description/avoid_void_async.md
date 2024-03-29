**DO** mark async functions as returning Future<void>.

When declaring an async method or function which does not return a value,
declare that it returns `Future<void>` and not just `void`.

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

**EXCEPTION**

An exception is made for top-level `main` functions, where the `Future`
annotation *can* (and generally should) be dropped in favor of `void`.

**GOOD:**
```dart
Future<void> f() async {}

void main() async {
  await f();
}
```
