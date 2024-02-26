#### Description

The analyzer produces this diagnostic when a type parameter of an
extension type is used in a non-covariant position in the representation
type of that extension type.

#### Example

The following code produces this diagnostic because the type parameter `T`
is used as a parameter type in the function type `void Function(T)`, and
parameters are not covariant:

```dart
extension type A<[!T!]>(void Function(T) f) {}
```

#### Common fixes

Remove the use of the type parameter:

```dart
extension type A(void Function(String) f) {}
```