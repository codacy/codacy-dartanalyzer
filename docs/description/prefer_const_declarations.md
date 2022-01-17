
**PREFER** using `const` for const declarations.

Const declarations are more hot-reload friendly and allow to use const
constructors if an instantiation references this declaration.

**GOOD:**
```dart
const o = <int>[];

class A {
  static const o = <int>[];
}
```

**BAD:**
```dart
final o = const <int>[];

class A {
  static final o = const <int>[];
}
```

