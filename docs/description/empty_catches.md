**AVOID** empty catch blocks.

In general, empty catch blocks should be avoided.  In cases where they are
intended, a comment should be provided to explain why exceptions are being
caught and suppressed.  Alternatively, the exception identifier can be named with
underscores (e.g., `_`) to indicate that we intend to skip it.

**BAD:**
```dart
try {
  ...
} catch(exception) { }
```

**GOOD:**
```dart
try {
  ...
} catch(e) {
  // ignored, really.
}

// Alternatively:
try {
  ...
} catch(_) { }

// Better still:
try {
  ...
} catch(e) {
  doSomething(e);
}
```

