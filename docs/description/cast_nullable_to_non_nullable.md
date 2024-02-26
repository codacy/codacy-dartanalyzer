**DON'T** cast a nullable value to a non nullable type. This hides a null check
and most of the time it is not what is expected.

**BAD:**
```dart
class A {}
class B extends A {}

A? a;
var v = a as B;
var v = a as A;
```

**GOOD:**
```dart
class A {}
class B extends A {}

A? a;
var v = a! as B;
var v = a!;
```

