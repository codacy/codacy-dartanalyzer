**AVOID** field initializers in const classes.

Instead of `final x = const expr;`, you should write `get x => const expr;` and
not allocate a useless field. As of April 2018 this is true for the VM, but not
for code that will be compiled to JS.

**BAD:**
```dart
class A {
  final a = const [];
  const A();
}
```

**GOOD:**
```dart
class A {
  get a => const [];
  const A();
}
```

