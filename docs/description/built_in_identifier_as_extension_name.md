#### Description

The analyzer produces this diagnostic when the name used in the declaration
of a class, extension, mixin, typedef, type parameter, or import prefix is
a built-in identifier. Built-in identifiers can't be used to name any of
these kinds of declarations.

#### Example

The following code produces this diagnostic because `mixin` is a built-in
identifier:

```dart
extension [!mixin!] on int {}
```

#### Common fixes

Choose a different name for the declaration.