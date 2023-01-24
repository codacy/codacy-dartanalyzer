#### Description

The analyzer produces this diagnostic when an expression whose type is
`Null` is being cast to a non-nullable type.

#### Example

The following code produces this diagnostic because `n` is known to always
be `null`, but it's being cast to a non-nullable type:

```dart
void f(Null n) {
  [!n as int!];
}
```

#### Common fixes

Remove the unnecessary cast:

```dart
void f(Null n) {
  n;
}
```