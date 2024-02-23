#### Description

The analyzer produces this diagnostic when an extension type implements a
type that it isn't allowed to implement.

#### Example

The following code produces this diagnostic because extension types can't
implement the type `dynamic`:

```dart
extension type A(int i) implements [!dynamic!] {}
```

#### Common fixes

Remove the disallowed type from the implements clause:

```dart
extension type A(int i) {}
```