#### Description

The analyzer produces this diagnostic when the `@Deprecated.instantiate`
annotation is applied to a declaration that isn't an instantiable class.
An instantiable class is one that isn't declared with the `abstract` or
`sealed` keywords and has at least one public, generative constructor.

#### Example

The following code produces this diagnostic because the annotation is on a
sealed class:

```dart
@[!Deprecated.instantiate!]()
sealed class C {}
```

#### Common fixes

Remove the annotation:

```dart
sealed class C {}
```