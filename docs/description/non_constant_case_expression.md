#### Description

The analyzer produces this diagnostic when the expression in a `case`
clause isn't a constant expression.

#### Example

The following code produces this diagnostic because `j` isn't a constant:

```dart
%language=2.18
void f(int i, int j) {
  switch (i) {
    case [!j!]:
      // ...
      break;
  }
}
```

#### Common fixes

Either make the expression a constant expression, or rewrite the `switch`
statement as a sequence of `if` statements:

```dart
void f(int i, int j) {
  if (i == j) {
    // ...
  }
}
```