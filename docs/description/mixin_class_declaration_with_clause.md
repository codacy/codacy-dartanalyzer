#### Description

The analyzer produces this diagnostic when a class with the `mixin`
modifier has a `with` clause. A mixin class declaration cannot have a
`with` clause because that implies it extends a class other than `Object`.

#### Example

The following code produces this diagnostic because the `mixin class` `B`
has a `with` clause:

```dart
mixin M {}

mixin class B [!with M!] {}
```

#### Common fixes

If you want to use the class as a mixin, remove the `with` clause:

```dart
mixin M {}

mixin class B {}
```

If you need the class to have a `with` clause, then remove the `mixin`
modifier:

```dart
mixin M {}

class B with M {}
```