#### Description

The analyzer produces this diagnostic when a subclass of `Struct` has more
than one `Packed` annotation.

For more information about FFI, see [C interop using dart:ffi][ffi].

#### Example

The following code produces this diagnostic because the class `C`, which
is a subclass of `Struct`, has two `Packed` annotations:

```dart
import 'dart:ffi';

@Packed(1)
[!@Packed(1)!]
final class C extends Struct {
  external Pointer<Uint8> notEmpty;
}
```

#### Common fixes

Remove all but one of the annotations:

```dart
import 'dart:ffi';

@Packed(1)
final class C extends Struct {
  external Pointer<Uint8> notEmpty;
}
```