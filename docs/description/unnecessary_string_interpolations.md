**DON'T** use string interpolation if there's only a string expression in it.

**BAD:**
```dart
String message;
String o = '$message';
```

**GOOD:**
```dart
String message;
String o = message;
```

