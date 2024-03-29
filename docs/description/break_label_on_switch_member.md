#### Description

The analyzer produces this diagnostic when a break in a case clause inside
a switch statement has a label that is associated with another case clause.

#### Example

The following code produces this diagnostic because the label `l` is
associated with the case clause for `0`:

```dart
%language=2.18
void f(int i) {
  switch (i) {
    l: case 0:
      break;
    case 1:
      break [!l!];
  }
}
```

#### Common fixes

If the intent is to transfer control to the statement after the switch,
then remove the label from the break statement:

```dart
void f(int i) {
  switch (i) {
    case 0:
      break;
    case 1:
      break;
  }
}
```

If the intent is to transfer control to a different case block, then use
`continue` rather than `break`:

```dart
%language=2.18
void f(int i) {
  switch (i) {
    l: case 0:
      break;
    case 1:
      continue l;
  }
}
```