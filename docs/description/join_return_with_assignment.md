**DO** join return statement with assignment when possible.

**BAD:**
```dart
class A {
  B _lazyInstance;
  static B get instance {
    _lazyInstance ??= B(); // LINT
    return _lazyInstance;
  }
}
```

**GOOD:**
```dart
class A {
  B _lazyInstance;
  static B get instance => _lazyInstance ??= B();
}
```

