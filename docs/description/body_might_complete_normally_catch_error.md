#### Description

The analyzer produces this diagnostic when the closure passed to the
`onError` parameter of the `Future.catchError` method is required to
return a non-`null` value (because of the `Future`s type argument) but can
implicitly return `null`.

#### Example

The following code produces this diagnostic because the closure passed to
the `catchError` method is required to return an `int` but doesn't end
with an explicit `return`, causing it to implicitly return `null`:

```dart
void g(Future<int> f) {
  f.catchError((e, st) [!{!]});
}
```

#### Common fixes

If the closure should sometimes return a non-`null` value, then add an
explicit return to the closure:

```dart
void g(Future<int> f) {
  f.catchError((e, st) {
    return -1;
  });
}
```

If the closure should always return `null`, then change the type argument
of the `Future` to be either `void` or `Null`:

```dart
void g(Future<void> f) {
  f.catchError((e, st) {});
}
```