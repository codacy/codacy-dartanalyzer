
**DO** use a boolean for assert conditions.

Not using booleans in assert conditions can lead to code where it isn't clear
what the intention of the assert statement is.

**BAD:**
```dart
assert(() {
  f();
  return true;
});
```

**GOOD:**
```dart
assert(() {
  f();
  return true;
}());
```

**DEPRECATED:** In Dart 2, `assert`s no longer accept  non-`bool` values so this
rule is made redundant by the Dart analyzer's basic checks and is no longer
necessary.
 
The rule will be removed in a future Linter release.
