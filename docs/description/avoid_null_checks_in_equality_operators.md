
**DON'T** check for null in custom == operators.

As null is a special type, no class can be equivalent to it.  Thus, it is
redundant to check whether the other instance is null. 

**BAD:**
```dart
class Person {
  final String name;

  @override
  operator ==(other) =>
      other != null && other is Person && name == other.name;
}
```

**GOOD:**
```dart
class Person {
  final String name;

  @override
  operator ==(other) => other is Person && name == other.name;
}
```

