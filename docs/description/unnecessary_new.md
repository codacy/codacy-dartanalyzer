
**AVOID** new keyword to create instances.

**BAD:**
```dart
class A { A(); }
m(){
  final a = new A();
}
```

**GOOD:**
```dart
class A { A(); }
m(){
  final a = A();
}
```

