#### Description

The analyzer produces this diagnostic when the type argument for the class
`Array` isn't one of the valid types: either a native integer, `Float`,
`Double`, `Pointer`, or subtype of `Struct`, `Union`, or
`AbiSpecificInteger`.

For more information about FFI, see [C interop using dart:ffi][ffi].

#### Example

The following code produces this diagnostic because the type argument to
`Array` is `Void`, and `Void` isn't one of the valid types:

```dart
import 'dart:ffi';

final class C extends Struct {
  @Array(8)
  external Array<[!Void!]> a0;
}
```

#### Common fixes

Change the type argument to one of the valid types:

```dart
import 'dart:ffi';

final class C extends Struct {
  @Array(8)
  external Array<Uint8> a0;
}
```