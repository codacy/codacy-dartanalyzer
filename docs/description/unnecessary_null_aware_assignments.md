
**AVOID** `null` in null-aware assignment.

Using `null` on the right-hand side of a null-aware assignment effectively makes
the assignment redundant.

**GOOD:**
```dart
var x;
x ??= 1;
```

**BAD:**
```dart
var x;
x ??= null;
```

