**AVOID** overloading operator == and hashCode on classes not marked `@immutable`.

If a class is not immutable, overloading operator == and hashCode can lead to
unpredictable and undesirable behavior when used in collections. See
https://dart.dev/guides/language/effective-dart/design#avoid-defining-custom-equality-for-mutable-classes
for more information.

**GOOD:**
```dart
@immutable
class A {
  final String key;
  const A(this.key);
  @override
  operator ==(other) => other is A && other.key == key;
  @override
  int get hashCode => key.hashCode;
}
```

**BAD:**
```dart
class B {
  String key;
  const B(this.key);
  @override
  operator ==(other) => other is B && other.key == key;
  @override
  int get hashCode => key.hashCode;
}
```

NOTE: The lint checks the use of the @immutable annotation, and will trigger
even if the class is otherwise not mutable. Thus:

**BAD:**
```dart
class C {
  final String key;
  const C(this.key);
  @override
  operator ==(other) => other is C && other.key == key;
  @override
  int get hashCode => key.hashCode;
}
```

