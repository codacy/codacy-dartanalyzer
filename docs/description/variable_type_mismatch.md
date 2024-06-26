#### Description

The analyzer produces this diagnostic when the evaluation of a constant
expression would result in a `CastException`.

#### Example

The following code produces this diagnostic because the value of `x` is an
`int`, which can't be assigned to `y` because an `int` isn't a `String`:

```dart
const dynamic x = 0;
const String y = [!x!];
```

#### Common fixes

If the declaration of the constant is correct, then change the value being
assigned to be of the correct type:

```dart
const dynamic x = 0;
const String y = '$x';
```

If the assigned value is correct, then change the declaration to have the
correct type:

```dart
const int x = 0;
const int y = x;
```