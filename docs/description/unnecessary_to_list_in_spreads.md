Unnecessary `toList()` in spreads.

**BAD:**
```dart
children: <Widget>[
  ...['foo', 'bar', 'baz'].map((String s) => Text(s)).toList(),
]
```

**GOOD:**
```dart
children: <Widget>[
  ...['foo', 'bar', 'baz'].map((String s) => Text(s)),
]
```

