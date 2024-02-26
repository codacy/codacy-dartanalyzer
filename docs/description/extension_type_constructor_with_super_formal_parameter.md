#### Description

The analyzer produces this diagnostic when a constructor in an extension
type has a super parameter. Super parameters aren't valid because
extension types don't have a superclass.

#### Example

The following code produces this diagnostic because the named constructor
`n` contains a super parameter:

```dart
extension type E(int i) {
  E.n(this.i, [!super!].foo);
}
```

#### Common fixes

If you need the parameter, replace the super parameter with a normal
parameter:

```dart
extension type E(int i) {
  E.n(this.i, String foo);
}
```

If you don't need the parameter, remove the super parameter:

```dart
extension type E(int i) {
  E.n(this.i);
}
```