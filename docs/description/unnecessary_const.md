**AVOID** repeating const keyword in a const context.

**BAD:**
```dart
class A { const A(); }
m(){
  const a = const A();
  final b = const [const A()];
}
```

**GOOD:**
```dart
class A { const A(); }
m(){
  const a = A();
  final b = const [A()];
}
```

