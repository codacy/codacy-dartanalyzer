#### Description

The analyzer produces this diagnostic when a null-assert pattern is used
to match a value that isn't nullable.

#### Example

The following code produces this diagnostic because the variable `x` isn't
nullable:

```dart
void f(int x) {
  if (x case var a[!!!] when a > 0) {}
}
```

#### Common fixes

Remove the null-assert pattern:

```dart
void f(int x) {
  if (x case var a when a > 0) {}
}
```