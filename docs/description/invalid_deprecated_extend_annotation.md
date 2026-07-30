#### Description

The analyzer produces this diagnostic when the `@Deprecated.extend`
annotation is applied to a declaration that isn't an extendable class. An
extendable class is one that isn't declared with the `interface`,
`final`, or `sealed` keywords and has at least one public, generative
constructor.

#### Example

The following code produces this diagnostic because the annotation is on a
sealed class:

```dart
@[!Deprecated.extend!]()
sealed class C {}
```

#### Common fixes

Remove the annotation:

```dart
sealed class C {}
```