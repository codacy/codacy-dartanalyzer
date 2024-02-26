**AVOID** bool literals in conditional expressions.

**BAD:**
```dart
condition ? true : boolExpression
condition ? false : boolExpression
condition ? boolExpression : true
condition ? boolExpression : false
```

**GOOD:**
```dart
condition || boolExpression
!condition && boolExpression
!condition || boolExpression
condition && boolExpression
```

