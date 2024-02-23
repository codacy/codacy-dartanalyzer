#### Description

The analyzer produces this diagnostic when a type following the `on`
keyword in a mixin declaration is neither a class nor a mixin.

#### Example

The following code produces this diagnostic because `F` is neither a class
nor a mixin:

```dart
typedef F = void Function();

mixin M on [!F!] {}
```

#### Common fixes

If the type was intended to be a class but was mistyped, then replace the
name.

Otherwise, remove the type from the `on` clause.