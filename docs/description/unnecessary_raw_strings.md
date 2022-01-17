
Use raw string only when needed.

**BAD:**
```dart
var s1 = r'a';
```

**GOOD:**
```dart
var s1 = 'a';
var s2 = r'$a';
var s3 = r'\a';
```

