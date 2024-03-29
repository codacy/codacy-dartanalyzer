**AVOID** integer literals that cannot be represented exactly when compiled to
JavaScript.

When a program is compiled to JavaScript `int` and `double` become JavaScript
Numbers. Too large integers (`value < Number.MIN_SAFE_INTEGER` or
`value > Number.MAX_SAFE_INTEGER`) may be rounded to the closest Number value.

For instance `1000000000000000001` cannot be represented exactly as a JavaScript
Number, so `1000000000000000000` will be used instead.

**BAD:**
```dart
int value = 9007199254740995;
```

**GOOD:**
```dart
BigInt value = BigInt.parse('9007199254740995');
```

