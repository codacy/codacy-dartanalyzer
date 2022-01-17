
Prefer using null aware operators instead of null checks in conditional
expressions.

**BAD:**
```dart
v = a == null ? null : a.b;
```

**GOOD:**
```dart
v = a?.b;
```

