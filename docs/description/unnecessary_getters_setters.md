From the [style guide](https://dart.dev/guides/language/effective-dart/style/):

**AVOID** wrapping fields in getters and setters just to be "safe".

In Java and C#, it's common to hide all fields behind getters and setters (or
properties in C#), even if the implementation just forwards to the field.  That
way, if you ever need to do more work in those members, you can do it without needing
to touch the callsites.  This is because calling a getter method is different
than accessing a field in Java, and accessing a property isn't binary-compatible
with accessing a raw field in C#.

Dart doesn't have this limitation.  Fields and getters/setters are completely
indistinguishable.  You can expose a field in a class and later wrap it in a
getter and setter without having to touch any code that uses that field.

**GOOD:**

```dart
class Box {
  var contents;
}
```

**BAD:**

```dart
class Box {
  var _contents;
  get contents => _contents;
  set contents(value) {
    _contents = value;
  }
}
```

