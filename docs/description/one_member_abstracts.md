From the [style guide](https://dart.dev/guides/language/effective-dart/style/):

**AVOID** defining a one-member abstract class when a simple function will do.

Unlike Java, Dart has first-class functions, closures, and a nice light syntax
for using them.  If all you need is something like a callback, just use a
function.  If you're defining a class and it only has a single abstract member
with a meaningless name like `call` or `invoke`, there is a good chance
you just want a function.

**GOOD:**
```dart
typedef Predicate = bool Function(item);
```

**BAD:**
```dart
abstract class Predicate {
  bool test(item);
}
```

