
Prefer using if null operators instead of null checks in conditional
expressions.

**BAD:**
```dart
v = a == null ? b : a;
```

**GOOD:**
```dart
v = a ?? b;
```

