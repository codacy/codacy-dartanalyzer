**DO** use trailing commas for all function calls and declarations unless the
function call or definition, from the start of the function name up to the
closing parenthesis, fits in a single line.

**GOOD:**
```dart
void run() {
  method(
    'does not fit on one line',
    'test test test test test test test test test test test',
  );
}
```

**BAD:**
```dart
void run() {
  method('does not fit on one line',
      'test test test test test test test test test test test');
}
```

**Exception:** If the final parameter/argument is positional (vs named) and is
either a function literal implemented using curly braces, a literal map, a
literal set or a literal array. This exception only applies if the final
parameter does not fit entirely on one line.

**Note:** This lint rule assumes `dart format` has been run over the code and
may produce false positives until that has happened.

