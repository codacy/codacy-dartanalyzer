#### Description

The analyzer produces this diagnostic when the body of an extension type
declaration contains a member with the same name as one of the members
declared by `Object`.

#### Example

The following code produces this diagnostic because the class `Object`
already defines a member named `hashCode`:

```dart
extension type E(int i) {
  int get [!hashCode!] => 0;
}
```

#### Common fixes

If you need a member with the implemented semantics, then rename the
member:

```dart
extension type E(int i) {
  int get myHashCode => 0;
}
```

If you don't need a member with the implemented semantics, then remove the
member:

```dart
extension type E(int i) {}
```