**DEPRECATED:** This rule is unmaintained and will be removed in a future Linter
release.

**DON'T** test for conditions that can be inferred at compile time or test the
same condition twice.

Conditional statements using a condition which cannot be anything but `false`
have the effect of making blocks of code non-functional.  If the condition
cannot evaluate to anything but `true`, the conditional statement is completely
redundant, and makes the code less readable.
It is quite likely that the code does not match the programmer's intent.
Either the condition should be removed or it should be updated so that it does
not always evaluate to `true` or `false` and does not perform redundant tests.
This rule will hint to the test conflicting with the linted one.

**BAD:**
```dart
// foo can't be both equal and not equal to bar in the same expression
if(foo == bar && something && foo != bar) {...}
```

**BAD:**
```dart
void compute(int foo) {
  if (foo == 4) {
    doSomething();
    // we know foo is equal to 4 at this point, so the next condition is always false
    if (foo > 4) {...}
    ...
  }
  ...
}
```

**BAD:**
```dart
void compute(bool foo) {
  if (foo) {
    return;
  }
  doSomething();
  // foo is always false here
  if (foo){...}
  ...
}
```

**GOOD:**
```dart
void nestedOK() {
  if (foo == bar) {
    foo = baz;
    if (foo != bar) {...}
  }
}
```

**GOOD:**
```dart
void nestedOk2() {
  if (foo == bar) {
    return;
  }

  foo = baz;
  if (foo == bar) {...} // OK
}
```

**GOOD:**
```dart
void nestedOk5() {
  if (foo != null) {
    if (bar != null) {
      return;
    }
  }

  if (bar != null) {...} // OK
}
```

