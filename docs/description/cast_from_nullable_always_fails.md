#### Description

The analyzer produces this diagnostic when a local variable that has a
nullable type hasn't been assigned and is cast to a non-nullable type.
Because the variable hasn't been assigned it has the default value of
`null`, causing the cast to throw an exception.

#### Example

The following code produces this diagnostic because the variable `x` is
cast to a non-nullable type (`int`) when it's known to have the value
`null`:

```dart
void f() {
  num? x;
  [!x!] as int;
  print(x);
}
```

#### Common fixes

If the variable is expected to have a value before the cast, then add an
initializer or an assignment:

```dart
void f() {
  num? x = 3;
  x as int;
  print(x);
}
```

If the variable isn't expected to be assigned, then remove the cast:

```dart
void f() {
  num? x;
  print(x);
}
```