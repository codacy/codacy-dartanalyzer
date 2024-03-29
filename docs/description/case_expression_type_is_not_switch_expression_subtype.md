#### Description

The analyzer produces this diagnostic when the expression following `case`
in a `switch` statement has a static type that isn't a subtype of the
static type of the expression following `switch`.

#### Example

The following code produces this diagnostic because `1` is an `int`, which
isn't a subtype of `String` (the type of `s`):

```dart
%language=2.18
void f(String s) {
  switch (s) {
    case [!1!]:
      break;
  }
}
```

#### Common fixes

If the value of the `case` expression is wrong, then change the `case`
expression so that it has the required type:

```dart
void f(String s) {
  switch (s) {
    case '1':
      break;
  }
}
```

If the value of the `case` expression is correct, then change the `switch`
expression to have the required type:

```dart
void f(int s) {
  switch (s) {
    case 1:
      break;
  }
}
```