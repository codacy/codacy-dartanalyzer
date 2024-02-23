#### Description

The analyzer produces this diagnostic when the representation type of an
extension type is the [bottom type][] `Never`. The type `Never` can't be
the representation type of an extension type because there are no values
that can be extended.

#### Example

The following code produces this diagnostic because the representation
type of the extension type `E` is `Never`:

```dart
extension type E([!Never!] n) {}
```

#### Common fixes

Replace the extension type with a different type:

```dart
extension type E(String s) {}
```