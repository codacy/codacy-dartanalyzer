#### Description

The analyzer produces this diagnostic when an extension type implements
itself, either directly or indirectly.

#### Example

The following code produces this diagnostic because the extension type `A`
directly implements itself:

```dart
extension type [!A!](int i) implements A {}
```

The following code produces this diagnostic because the extension type `A`
indirectly implements itself (through `B`):

```dart
extension type [!A!](int i) implements B {}

extension type [!B!](int i) implements A {}
```

#### Common fixes

Break the cycle by removing a type from the implements clause of at least
one of the types involved in the cycle:

```dart
extension type A(int i) implements B {}

extension type B(int i) {}
```