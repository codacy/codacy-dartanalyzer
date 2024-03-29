#### Description

The analyzer produces this diagnostic when a field in a subclass of
`Struct` has more than one annotation describing the native type of the
field.

For more information about FFI, see [C interop using dart:ffi][ffi].

#### Example

The following code produces this diagnostic because the field `x` has two
annotations describing the native type of the field:

```dart
import 'dart:ffi';

final class C extends Struct {
  @Int32()
  [!@Int16()!]
  external int x;
}
```

#### Common fixes

Remove all but one of the annotations:

```dart
import 'dart:ffi';
final class C extends Struct {
  @Int32()
  external int x;
}
```