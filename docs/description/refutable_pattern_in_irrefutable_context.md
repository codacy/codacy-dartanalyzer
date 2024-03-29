#### Description

The analyzer produces this diagnostic when a [refutable pattern][] is used
in a context where only an [irrefutable pattern][] is allowed.

The refutable patterns that are disallowed are:
- logical-or
- relational
- null-check
- constant

The contexts that are checked are:
- pattern-based variable declarations
- pattern-based for loops
- assignments with a pattern on the left-hand side

#### Example

The following code produces this diagnostic because the null-check
pattern, which is a refutable pattern, is in a pattern-based variable
declaration, which doesn't allow refutable patterns:

```dart
void f(int? x) {
  var ([!_?!]) = x;
}
```

#### Common fixes

Rewrite the code to not use a refutable pattern in an irrefutable context.