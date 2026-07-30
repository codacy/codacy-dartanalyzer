#### Description

The analyzer produces this diagnostic when the `@Deprecated.mixin`
annotation is applied to a declaration that isn't a mixin class.

#### Example

The following code produces this diagnostic because the annotation is on a
non-mixin class:

```dart
@[!Deprecated.mixin!]()
class C {}
```

#### Common fixes

Remove the annotation:

```dart
class C {}
```