#### Description

The analyzer produces this diagnostic when it finds a `return` statement
without an expression in a function that declares a return type.

#### Example

The following code produces this diagnostic because the function `f` is
expected to return an `int`, but no value is being returned:

```dart
int f() {
  [!return!];
}
```

#### Common fixes

Add an expression that computes the value to be returned:

```dart
int f() {
  return 0;
}
```