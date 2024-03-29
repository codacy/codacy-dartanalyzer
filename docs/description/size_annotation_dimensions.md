#### Description

The analyzer produces this diagnostic when the number of dimensions
specified in an `Array` annotation doesn't match the number of nested
arrays specified by the type of a field.

For more information about FFI, see [C interop using dart:ffi][ffi].

#### Example

The following code produces this diagnostic because the field `a0` has a
type with three nested arrays, but only two dimensions are given in the
`Array` annotation:

```dart
import 'dart:ffi';

final class C extends Struct {
  [!@Array(8, 8)!]
  external Array<Array<Array<Uint8>>> a0;
}
```

#### Common fixes

If the type of the field is correct, then fix the annotation to have the
required number of dimensions:

```dart
import 'dart:ffi';

final class C extends Struct {
  @Array(8, 8, 4)
  external Array<Array<Array<Uint8>>> a0;
}
```

If the type of the field is wrong, then fix the type of the field:

```dart
import 'dart:ffi';

final class C extends Struct {
  @Array(8, 8)
  external Array<Array<Uint8>> a0;
}
```