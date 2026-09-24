#### Description

The analyzer produces this diagnostic when a mixin application class
with the `mixin` modifier has more than one mixin. A mixin class
application can only have a single mixin.

#### Example

The following code produces this diagnostic because the `mixin class C`
has multiple mixins:

```dart
mixin M1 {}

mixin M2 {}

mixin class C = Object [!with M1, M2!];
```

#### Common fixes

If you need to use multiple mixins, remove the `mixin` modifier from the
mixin application class:

```dart
mixin M1 {}

mixin M2 {}

class C = Object with M1, M2;
```

If you need the class to be a `mixin class`, then only use a single mixin:

```dart
mixin M1 {}

mixin class C = Object with M1;
```