**DO** override `hashCode` if overriding `==` and prefer overriding `==` if
overriding `hashCode`.

Every object in Dart has a `hashCode`.  Both the `==` operator and the
`hashCode` property of objects must be consistent in order for a common hash
map implementation to function properly.  Thus, when overriding `==`, the
`hashCode` should also be overridden to maintain consistency. Similarly, if
`hashCode` is overridden, `==` should be also.

**BAD:**
```dart
class Bad {
  final int value;
  Bad(this.value);

  @override
  bool operator ==(Object other) => other is Bad && other.value == value;
}
```

**GOOD:**
```dart
class Better {
  final int value;
  Better(this.value);

  @override
  bool operator ==(Object other) =>
      other is Better &&
      other.runtimeType == runtimeType &&
      other.value == value;

  @override
  int get hashCode => value.hashCode;
}
```
