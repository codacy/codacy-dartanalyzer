#### Description

The analyzer produces this diagnostic when a local variable that was
declared to be final is assigned after it was initialized.

#### Example

The following code produces this diagnostic because `x` is final, so it
can't have a value assigned to it after it was initialized:

```dart
void f() {
  final x = 0;
  [!x!] = 3;
  print(x);
}
```

#### Common fixes

Remove the keyword `final`, and replace it with `var` if there's no type
annotation:

```dart
void f() {
  var x = 0;
  x = 3;
  print(x);
}
```