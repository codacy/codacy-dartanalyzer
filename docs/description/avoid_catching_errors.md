**DON'T** explicitly catch Error or types that implement it.

Errors differ from Exceptions in that Errors can be analyzed and prevented prior
to runtime.  It should almost never be necessary to catch an error at runtime.

**BAD:**
```dart
try {
  somethingRisky();
} on Error catch(e) {
  doSomething(e);
}
```

**GOOD:**
```dart
try {
  somethingRisky();
} on Exception catch(e) {
  doSomething(e);
}
```

