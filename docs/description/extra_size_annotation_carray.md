#### Description

The analyzer produces this diagnostic when a field in a subclass of
`Struct` has more than one annotation describing the size of the native
array.

For more information about FFI, see [C interop using dart:ffi][ffi].

#### Example

The following code produces this diagnostic because the field `a0` has two
annotations that specify the size of the native array:

```dart
import 'dart:ffi';

class C extends Struct {
  @Array(4)
  [!@Array(8)!]
  external Array<Uint8> a0;
}
```

#### Common fixes

Remove all but one of the annotations:

```dart
import 'dart:ffi';

class C extends Struct {
  @Array(8)
  external Array<Uint8> a0;
}
```