#### Description

The analyzer produces this diagnostic when it finds an equality comparison
(either `==` or `!=`) with one operand of `null` and the other operand
can't be `null`. Such comparisons are always either `true` or `false`, so
they serve no purpose.

#### Examples

The following code produces this diagnostic because `x` can never be
`null`, so the comparison always evaluates to `true`:

```dart
void f(int x) {
  if (x [!!= null!]) {
    print(x);
  }
}
```

The following code produces this diagnostic because `x` can never be
`null`, so the comparison always evaluates to `false`:

```dart
void f(int x) {
  if (x [!== null!]) {
    throw ArgumentError("x can't be null");
  }
}
```

#### Common fixes

If the other operand should be able to be `null`, then change the type of
the operand:

```dart
void f(int? x) {
  if (x != null) {
    print(x);
  }
}
```

If the other operand really can't be `null`, then remove the condition:

```dart
void f(int x) {
  print(x);
}
```