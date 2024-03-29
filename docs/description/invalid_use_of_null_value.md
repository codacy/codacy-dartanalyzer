#### Description

The analyzer produces this diagnostic when an expression whose value will
always be `null` is dereferenced.

#### Example

The following code produces this diagnostic because `x` will always be
`null`:

```dart
int f(Null x) {
  return x.[!length!];
}
```

#### Common fixes

If the value is allowed to be something other than `null`, then change the
type of the expression:

```dart
int f(String? x) {
  return x!.length;
}
```