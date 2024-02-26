**PREFER** the use of intValue.isOdd/isEven to check for evenness.

**BAD:**
```dart
bool isEven = 1 % 2 == 0;
bool isOdd = 13 % 2 == 1;
```

**GOOD:**
```dart
bool isEven = 1.isEven;
bool isOdd = 13.isOdd;
```

