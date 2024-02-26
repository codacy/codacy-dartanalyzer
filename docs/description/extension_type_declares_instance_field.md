#### Description

The analyzer produces this diagnostic when there's a field declaration in
the body of an extension type declaration.

#### Example

The following code produces this diagnostic because the extension type `E`
declares a field named `f`:

```dart
extension type E(int i) {
  final int [!f!] = 0;
}
```

#### Common fixes

If you don't need the field, then remove it or replace it with a getter
and/or setter:

```dart
extension type E(int i) {
  int get f => 0;
}
```

If you need the field, then convert the extension type into a class:

```dart
class E {
  final int i;

  final int f = 0;

  E(this.i);
}
```