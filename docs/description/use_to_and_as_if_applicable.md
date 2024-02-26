From the [design guide](https://dart.dev/guides/language/effective-dart/design):

**PREFER** naming a method to___() if it copies the object's state to a new object.

**PREFER** naming a method as___() if it returns a different representation backed by the original object.

**BAD:**
```dart
class Bar {
  Foo myMethod() {
    return Foo.from(this);
  }
}
```

**GOOD:**
```dart
class Bar {
  Foo toFoo() {
    return Foo.from(this);
  }
}
```

**GOOD:**
```dart
class Bar {
  Foo asFoo() {
    return Foo.from(this);
  }
}
```

