When checking if an object is not of a specified type, it is preferable to use the 'is!' operator.

**BAD:**
```dart
if (!(foo is Foo)) {
  ...
}
```

**GOOD:**
```dart
if (foo is! Foo) {
  ...
}
```

