#### Description

The analyzer produces this diagnostic when the operand of the `!` operator
can't be `null`.

#### Example

The following code produces this diagnostic because `x` can't be `null`:

```dart
int f(int x) {
  return x[!!!];
}
```

#### Common fixes

Remove the null check operator (`!`):

```dart
int f(int x) {
  return x;
}
```