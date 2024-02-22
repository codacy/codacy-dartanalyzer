**PREFER** using `const` for instantiating constant constructors.

If a constructor can be invoked as const to produce a canonicalized instance,
it's preferable to do so.

**GOOD:**
```dart
class A {
  const A();
}

void accessA() {
  A a = const A();
}
```

**GOOD:**
```dart
class A {
  final int x;

  const A(this.x);
}

A foo(int x) => new A(x);
```

**BAD:**
```dart
class A {
  const A();
}

void accessA() {
  A a = new A();
}
```

