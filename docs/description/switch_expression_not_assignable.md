#### Description

The analyzer produces this diagnostic when the type of the expression in a
`switch` statement isn't assignable to the type of the expressions in the
`case` clauses.

#### Example

The following code produces this diagnostic because the type of `s`
(`String`) isn't assignable to the type of `0` (`int`):

```dart
%language=2.9
void f(String s) {
  switch ([!s!]) {
    case 0:
      break;
  }
}
```

#### Common fixes

If the type of the `case` expressions is correct, then change the
expression in the `switch` statement to have the correct type:

```dart
%language=2.9
void f(String s) {
  switch (int.parse(s)) {
    case 0:
      break;
  }
}
```

If the type of the `switch` expression is correct, then change the `case`
expressions to have the correct type:

```dart
%language=2.9
void f(String s) {
  switch (s) {
    case '0':
      break;
  }
}
```