From the [flutter style guide](https://flutter.dev/style-guide/):

**DO** separate the control structure expression from its statement.

Don't put the statement part of an `if`, `for`, `while`, `do` on the same line
as the expression, even if it is short.  Doing so makes it unclear that there
is relevant code there.  This is especially important for early returns.

**GOOD:**
```dart
if (notReady)
  return;

if (notReady)
  return;
else
  print('ok')

while (condition)
  i += 1;
```

**BAD:**
```dart
if (notReady) return;

if (notReady)
  return;
else print('ok')

while (condition) i += 1;
```

