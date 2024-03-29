#### Description

The analyzer produces this diagnostic when a value is compared to
`double.nan` using either `==` or `!=`.

Dart follows the [IEEE 754] floating-point standard for the semantics of
floating point operations, which states that, for any floating point value
`x` (including NaN, positive infinity, and negative infinity),
- `NaN == x` is always false
- `NaN != x` is always true

As a result, comparing any value to NaN is pointless because the result is
already known (based on the comparison operator being used).

#### Example

The following code produces this diagnostic because `d` is being compared
to `double.nan`:

```dart
bool isNaN(double d) => d [!== double.nan!];
```

#### Common fixes

Use the getter `double.isNaN` instead:

```dart
bool isNaN(double d) => d.isNaN;
```