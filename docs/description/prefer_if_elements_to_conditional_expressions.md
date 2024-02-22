When building collections, it is preferable to use `if` elements rather than
conditionals.

**BAD:**
```dart
var list = ['a', 'b', condition ? 'c' : null].where((e) => e != null).toList();
```

**GOOD:**
```dart
var list = ['a', 'b', if (condition) 'c'];
```
