
**DO** provide doc comments for all public APIs.

As described in the [pub package layout doc](https://dart.dev/tools/pub/package-layout#implementation-files),
public APIs consist in everything in your package's `lib` folder, minus
implementation files in `lib/src`, adding elements explicitly exported with an
`export` directive.

For example, given `lib/foo.dart`:
```dart
export 'src/bar.dart' show Bar;
export 'src/baz.dart';

class Foo { }

class _Foo { }
```
its API includes:

* `Foo` (but not `_Foo`)
* `Bar` (exported) and
* all *public* elements in `src/baz.dart`

All public API members should be documented with `///` doc-style comments.

**GOOD:**
```dart
/// A Foo.
abstract class Foo {
  /// Start foo-ing.
  void start() => _start();

  _start();
}
```

**BAD:**
```dart
class Bar {
  void bar();
}
```

Advice for writing good doc comments can be found in the
[Doc Writing Guidelines](https://dart.dev/guides/language/effective-dart/documentation).

