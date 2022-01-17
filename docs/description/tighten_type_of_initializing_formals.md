
Tighten type of initializing formal if a non-null assert exists. This allows the
type system to catch problems rather than have them only be caught at run-time.

**BAD:**
```dart
class A {
  A.c1(this.p) : assert(p != null);
  A.c2(this.p);
  final String? p;
}
```

**GOOD:**
```dart
class A {
  A.c1(String this.p) : assert(p != null);
  A.c2(this.p);
  final String? p;
}
```

