#### Description

The analyzer produces this diagnostic when [definite assignment][] analysis
shows that a local variable that's marked as `late` is read before being
assigned.

#### Example

The following code produces this diagnostic because `x` wasn't assigned a
value before being read:

```dart
void f(bool b) {
  late int x;
  print([!x!]);
}
```

#### Common fixes

Assign a value to the variable before reading from it:

```dart
void f(bool b) {
  late int x;
  x = b ? 1 : 0;
  print(x);
}
```