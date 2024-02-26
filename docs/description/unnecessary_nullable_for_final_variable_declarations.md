Use a non-nullable type for a final variable initialized with a non-nullable
value.

**BAD:**
```dart
final int? i = 1;
```

**GOOD:**
```dart
final int i = 1;
```

