#### Description

The analyzer produces this diagnostic when an operator that can only be
used as a unary operator is used as a binary operator.

#### Example

The following code produces this diagnostic because the operator `~` can
only be used as a unary operator:

```dart
var a = 5 [!~!] 3;
```

#### Common fixes

Replace the operator with the correct binary operator:

```dart
var a = 5 - 3;
```