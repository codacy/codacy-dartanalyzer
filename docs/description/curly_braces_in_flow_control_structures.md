**DO** use curly braces for all flow control structures.

Doing so avoids the [dangling else](https://en.wikipedia.org/wiki/Dangling_else)
problem.

**GOOD:**
```dart
if (isWeekDay) {
  print('Bike to work!');
} else {
  print('Go dancing or read a book!');
}
```

There is one exception to this: an `if` statement with no `else` clause where
the entire `if` statement and the then body all fit in one line. In that case,
you may leave off the braces if you prefer:

**GOOD:**
```dart
if (arg == null) return defaultValue;
```

If the body wraps to the next line, though, use braces:

**GOOD:**
```dart
if (overflowChars != other.overflowChars) {
  return overflowChars < other.overflowChars;
}
```

**BAD:**
```dart
if (overflowChars != other.overflowChars)
  return overflowChars < other.overflowChars;
```
