#### Description

The analyzer produces this diagnostic when the last statement in a `case`
block isn't one of the required terminators: `break`, `continue`,
`rethrow`, `return`, or `throw`.

#### Example

The following code produces this diagnostic because the `case` block ends
with an assignment:

```dart
%language=2.9
void f(int x) {
  switch (x) {
    [!case!] 0:
      x += 2;
    default:
      x += 1;
  }
}
```

#### Common fixes

Add one of the required terminators:

```dart
%language=2.9
void f(int x) {
  switch (x) {
    case 0:
      x += 2;
      break;
    default:
      x += 1;
  }
}
```