**DO** throw only instances of classes that extend `dart.core.Error` or
`dart.core.Exception`.

Throwing instances that do not extend `Error` or `Exception` is a bad practice;
doing this is usually a hack for something that should be implemented more
thoroughly.

**BAD:**
```dart
void throwString() {
  throw 'hello world!'; // LINT
}
```

**GOOD:**
```dart
void throwArgumentError() {
  Error error = ArgumentError('oh!');
  throw error; // OK
}
```

