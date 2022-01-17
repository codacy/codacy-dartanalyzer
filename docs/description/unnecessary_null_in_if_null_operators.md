
**AVOID** using `null` as an operand in `if null` operators.

Using `null` in an `if null` operator is redundant, regardless of which side
`null` is used on.

**GOOD:**
```dart
var x = a ?? 1;
```

**BAD:**
```dart
var x = a ?? null;
var y = null ?? 1;
```

