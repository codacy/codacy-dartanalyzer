#### Description

The analyzer produces this diagnostic when a declaration of an operator has
the wrong number of parameters.

#### Example

The following code produces this diagnostic because the operator `+` must
have a single parameter corresponding to the right operand:

```dart
class C {
  int operator [!+!](a, b) => 0;
}
```

#### Common fixes

Add or remove parameters to match the required number:

```dart
class C {
  int operator +(a) => 0;
}
```
TODO(brianwilkerson) It would be good to add a link to the spec or some
 other documentation that lists the number of parameters for each operator,
 but I don't know what to link to.