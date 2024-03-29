**DON'T** use `length` to see if a collection is empty.

The `Iterable` contract does not require that a collection know its length or be
able to provide it in constant time.  Calling `length` just to see if the
collection contains anything can be painfully slow.

Instead, there are faster and more readable getters: `isEmpty` and
`isNotEmpty`.  Use the one that doesn't require you to negate the result.

**GOOD:**
```dart
if (lunchBox.isEmpty) return 'so hungry...';
if (words.isNotEmpty) return words.join(' ');
```

**BAD:**
```dart
if (lunchBox.length == 0) return 'so hungry...';
if (words.length != 0) return words.join(' ');
```

