#### Description

The analyzer produces this diagnostic when the result of dividing two
numbers is converted to an integer using `toInt`. Dart has a built-in
integer division operator that is both more efficient and more concise.

#### Example

The following code produces this diagnostic because the result of dividing
`x` and `y` is converted to an integer using `toInt`:

```dart
int divide(int x, int y) => [!(x / y).toInt()!];
```

#### Common fixes

Use the integer division operator (`~/`):

```dart
int divide(int x, int y) => x ~/ y;
```