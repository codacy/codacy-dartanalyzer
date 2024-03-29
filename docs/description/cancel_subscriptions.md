**DO** invoke `cancel` on instances of `dart.async.StreamSubscription`.

Cancelling instances of StreamSubscription prevents memory leaks and unexpected
behavior.

**BAD:**
```dart
class A {
  StreamSubscription _subscriptionA; // LINT
  void init(Stream stream) {
    _subscriptionA = stream.listen((_) {});
  }
}
```

**BAD:**
```dart
void someFunction() {
  StreamSubscription _subscriptionF; // LINT
}
```

**GOOD:**
```dart
class B {
  StreamSubscription _subscriptionB; // OK
  void init(Stream stream) {
    _subscriptionB = stream.listen((_) {});
  }

  void dispose(filename) {
    _subscriptionB.cancel();
  }
}
```

**GOOD:**
```dart
void someFunctionOK() {
  StreamSubscription _subscriptionB; // OK
  _subscriptionB.cancel();
}
```

