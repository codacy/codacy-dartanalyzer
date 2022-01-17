
**AVOID** return types on setters.

As setters do not return a value, declaring the return type of one is redundant.

**GOOD:**
```dart
set speed(int ms);
```

**BAD:**
```dart
void set speed(int ms);
```

