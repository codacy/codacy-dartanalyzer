
**DO** document all public members.

All non-overriding public members should be documented with `///` doc-style
comments.

**GOOD:**
```dart
/// A good thing.
abstract class Good {
  /// Start doing your thing.
  void start() => _start();

  _start();
}
```

**BAD:**
```dart
class Bad {
  void meh() { }
}
```

In case a public member overrides a member it is up to the declaring member
to provide documentation.  For example, in the following, `Sub` needn't
document `init` (though it certainly may, if there's need).

**GOOD:**
```dart
/// Base of all things.
abstract class Base {
  /// Initialize the base.
  void init();
}

/// A sub base.
class Sub extends Base {
  @override
  void init() { ... }
}
```

Note that consistent with `dartdoc`, an exception to the rule is made when
documented getters have corresponding undocumented setters.  In this case the
setters inherit the docs from the getters.

