From [Effective Dart](https://dart.dev/guides/language/effective-dart/usage#dont-explicitly-initialize-variables-to-null):

**DON'T** explicitly initialize variables to null.

In Dart, a variable or field that is not explicitly initialized automatically
gets initialized to null.  This is reliably specified by the language.  There's
no concept of "uninitialized memory" in Dart.  Adding `= null` is redundant and
unneeded.

**GOOD:**
```dart
int _nextId;

class LazyId {
  int _id;

  int get id {
    if (_nextId == null) _nextId = 0;
    if (_id == null) _id = _nextId++;

    return _id;
  }
}
```

**BAD:**
```dart
int _nextId = null;

class LazyId {
  int _id = null;

  int get id {
    if (_nextId == null) _nextId = 0;
    if (_id == null) _id = _nextId++;

    return _id;
  }
}
```

