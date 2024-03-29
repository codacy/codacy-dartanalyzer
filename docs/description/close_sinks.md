**DO** invoke `close` on instances of `dart.core.Sink`.

Closing instances of Sink prevents memory leaks and unexpected behavior.

**BAD:**
```dart
class A {
  IOSink _sinkA;
  void init(filename) {
    _sinkA = File(filename).openWrite(); // LINT
  }
}
```

**BAD:**
```dart
void someFunction() {
  IOSink _sinkF; // LINT
}
```

**GOOD:**
```dart
class B {
  IOSink _sinkB;
  void init(filename) {
    _sinkB = File(filename).openWrite(); // OK
  }

  void dispose(filename) {
    _sinkB.close();
  }
}
```

**GOOD:**
```dart
void someFunctionOK() {
  IOSink _sinkFOK; // OK
  _sinkFOK.close();
}
```

