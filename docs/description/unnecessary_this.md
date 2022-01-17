
From the [style guide](https://dart.dev/guides/language/effective-dart/style/):

**DON'T** use `this` when not needed to avoid shadowing.

**BAD:**
```dart
class Box {
  var value;
  void update(new_value) {
    this.value = new_value;
  }
}
```

**GOOD:**
```dart
class Box {
  var value;
  void update(new_value) {
    value = new_value;
  }
}
```

**GOOD:**
```dart
class Box {
  var value;
  void update(value) {
    this.value = value;
  }
}
```

