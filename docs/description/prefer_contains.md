**DON'T** use `indexOf` to see if a collection contains an element.

Calling `indexOf` to see if a collection contains something is difficult to read
and may have poor performance.

Instead, prefer `contains`.

**GOOD:**
```dart
if (!lunchBox.contains('sandwich')) return 'so hungry...';
```

**BAD:**
```dart
if (lunchBox.indexOf('sandwich') == -1) return 'so hungry...';
```

