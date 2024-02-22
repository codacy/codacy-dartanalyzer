A raw string can be used to avoid escaping only backslashes and dollars.

**BAD:**
```dart
var s = 'A string with only \\ and \$';
```

**GOOD:**
```dart
var s = r'A string with only \ and $';
```

