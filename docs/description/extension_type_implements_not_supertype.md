#### Description

The analyzer produces this diagnostic when an extension type implements a
type that isn't a supertype of the representation type.

#### Example

The following code produces this diagnostic because the extension type `A`
implements `String`, but `String` isn't a supertype of the representation
type `int`:

```dart
extension type A(int i) implements [!String!] {}
```

#### Common fixes

If the representation type is correct, then remove or replace the type in
the implements clause:

```dart
extension type A(int i) {}
```

If the representation type isn't correct, then replace it with the correct
type:

```dart
extension type A(String s) implements String {}
```