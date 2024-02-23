#### Description

The analyzer produces this diagnostic when a class or mixin has a direct
or indirect supertype that is either `base` or `final`, but the class or
mixin itself isn't marked either `base`, `final`, or `sealed`.

#### Example

The following code produces this diagnostic because the class `B` is a
subtype of `A`, and `A` is a `base` class, but `B` is neither `base`,
`final` or `sealed`:

```dart
base class A {}
class [!B!] extends A {}
```

#### Common fixes

Add either `base`, `final` or `sealed` to the class or mixin declaration:

```dart
base class A {}
final class B extends A {}
```