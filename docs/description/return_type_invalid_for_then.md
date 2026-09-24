#### Description

The analyzer produces this diagnostic when the return type of the
`onError` argument in `Future.then` is incompatible with the return type
of the `onValue` argument. At runtime, `Future.then` attempts to return
the value from the `onError` handler as the future's result, which
throws another exception.

#### Examples

The following code produces this diagnostic because the `onError` handler
returns a `String` instead of an `int`:

```dart
void f(Future<int> future) {
  future.then((_) => 0, onError: (e, st) => [!'c'!]);
}
```

The following code produces this diagnostic because the return type of the
`onError` argument (`cb`) is incompatible with the return type of
`onValue`:

```dart
void f(Future<int> future, String Function(dynamic, StackTrace) cb) {
  future.then<int>((_) => 1, onError: [!cb!]);
}
```

#### Common fixes

If the `onValue` handler returns the correct type, then change the
`onError` handler to match:

```dart
void f(Future<int> future) {
  future.then((_) => 0, onError: (e, st) => -1);
}
```

If the `onError` handler is correct, then change the `onValue` handler to
match:

```dart
void f(Future<String> future) {
  future.then((_) => 'a', onError: (e, st) => 'c');
}
```

If both handlers are correct, then change the future type to match:

```dart
void f(Future<String> future) {
  future.then<Object>((_) => 0, onError: (e, st) => 'c');
}
```