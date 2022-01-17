
**PREFER** declaring const constructors on `@immutable` classes.

If a class is immutable, it is usually a good idea to make its constructor a
const constructor.

**GOOD:**
```dart
@immutable
class A {
  final a;
  const A(this.a);
}
```

**BAD:**
```dart
@immutable
class A {
  final a;
  A(this.a);
}
```

