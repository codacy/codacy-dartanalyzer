#### Description

The analyzer produces this diagnostic when the type of the expression in a
throw expression isn't assignable to `Object`. It isn't valid to throw
`null`, so it isn't valid to use an expression that might evaluate to
`null`.

#### Example

The following code produces this diagnostic because `s` might be `null`:

```dart
void f(String? s) {
  throw [!s!];
}
```

#### Common fixes

Add an explicit null-check to the expression:

```dart
void f(String? s) {
  throw s!;
}
```