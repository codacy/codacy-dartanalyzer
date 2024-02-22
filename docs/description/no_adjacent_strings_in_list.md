**DON'T** use adjacent strings in list.

This can be sign of forgotten comma.

**GOOD:**
```dart
List<String> list = <String>[
  'a' +
  'b',
  'c',
];
```

**BAD:**
```dart
List<String> list = <String>[
  'a'
  'b',
  'c',
];
```

