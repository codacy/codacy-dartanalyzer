**PREFER** using `const` for instantiating list, map and set literals used as
parameters in immutable class instantiations.

**BAD:**
```dart
@immutable
class A {
  A(this.v);
  final v;
}

A a1 = new A([1]);
A a2 = new A({});
```

**GOOD:**
```dart
A a1 = new A(const [1]);
A a2 = new A(const {});
```

