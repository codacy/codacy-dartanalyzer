#### Description

The analyzer produces this diagnostic when an extension type declares an
abstract member. Because extension type member references are resolved
statically, an abstract member in an extension type could never be
executed.

#### Example

The following code produces this diagnostic because the method `m` in the
extension type `E` is abstract:

```dart
extension type E(String s) {
  [!void m();!]
}
```

#### Common fixes

If the member is intended to be executable, then provide an implementation
of the member:

```dart
extension type E(String s) {
  void m() {}
}
```

If the member isn't intended to be executable, then remove it:

```dart
extension type E(String s) {}
```