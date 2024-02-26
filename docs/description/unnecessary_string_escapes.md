Remove unnecessary backslashes in strings.

**BAD:**
```dart
'this string contains 2 \"double quotes\" ';
"this string contains 2 \'single quotes\' ";
```

**GOOD:**
```dart
'this string contains 2 "double quotes" ';
"this string contains 2 'single quotes' ";
```

