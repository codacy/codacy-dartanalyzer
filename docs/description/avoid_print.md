**DO** avoid `print` calls in production code.

For production code, consider using a logging framework.
If you are using Flutter, you can use `debugPrint`
or surround `print` calls with a check for `kDebugMode`

**BAD:**
```dart
void f(int x) {
  print('debug: $x');
  ...
}
```


**GOOD:**
```dart
void f(int x) {
  debugPrint('debug: $x');
  ...
}
```


**GOOD:**
```dart
void f(int x) {
  log('log: $x');
  ...
}
```


**GOOD:**
```dart
void f(int x) {
  if (kDebugMode) {
      print('debug: $x');
  }
  ...
}
```
