#### Description

The analyzer produces this diagnostic when the declaration of an instance
method named `factory` is interpreted as a constructor declaration after
the `primary_constructors` feature is enabled.

This issue only affects declarations that lack a return type and where the
method name is the first token or is preceded only by `external`,
`augment`, or `augment external`. The `augment` and `augment external`
keywords are valid only after the augmentations feature is enabled.

#### Example

The following code produces this diagnostic because the instance method
named `factory` has no return type or modifiers:

```dart
// @dart=3.10
class C {
  [!factory!]() => C();
}
```

#### Common fixes

If the name can be changed, then rename the method:

```dart
// @dart=3.10
class C {
  make() => C();
}
```

If the name must remain `factory`, then add a return type:

```dart
// @dart=3.10
class C {
  C factory() => C();
}
```