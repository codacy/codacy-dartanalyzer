#### Description

The analyzer produces this diagnostic when the operand of the unary
negation operator (`!`) doesn't have the type `bool`.

#### Example

The following code produces this diagnostic because `x` is an `int` when it
must be a `bool`:

```dart
int x = 0;
bool y = ![!x!];
```

#### Common fixes

Replace the operand with an expression that has the type `bool`:

```dart
int x = 0;
bool y = !(x > 0);
```