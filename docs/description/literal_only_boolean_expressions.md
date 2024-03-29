**DON'T** test for conditions composed only by literals, since the value can be
inferred at compile time.

Conditional statements using a condition which cannot be anything but FALSE have
the effect of making blocks of code non-functional.  If the condition cannot
evaluate to anything but `true`, the conditional statement is completely
redundant, and makes the code less readable.
It is quite likely that the code does not match the programmer's intent.
Either the condition should be removed or it should be updated so that it does
not always evaluate to `true` or `false`.

**BAD:**
```dart
void bad() {
  if (true) {} // LINT
}
```

**BAD:**
```dart
void bad() {
  if (true && 1 != 0) {} // LINT
}
```

**BAD:**
```dart
void bad() {
  if (1 != 0 && true) {} // LINT
}
```

**BAD:**
```dart
void bad() {
  if (1 < 0 && true) {} // LINT
}
```

**BAD:**
```dart
void bad() {
  if (true && false) {} // LINT
}
```

**BAD:**
```dart
void bad() {
  if (1 != 0) {} // LINT
}
```

**BAD:**
```dart
void bad() {
  if (true && 1 != 0 || 3 < 4) {} // LINT
}
```

**BAD:**
```dart
void bad() {
  if (1 != 0 || 3 < 4 && true) {} // LINT
}
```

**NOTE:** that an exception is made for the common `while (true) { }` idiom,
which is often reasonably preferred to the equivalent `for (;;)`.

**GOOD:**
```dart
void good() {
  while (true) {
    // Do stuff.
  }
}
```
