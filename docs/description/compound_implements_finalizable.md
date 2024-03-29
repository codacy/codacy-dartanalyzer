#### Description

The analyzer produces this diagnostic when a subclass of either `Struct`
or `Union` implements `Finalizable`.

For more information about FFI, see [C interop using dart:ffi][ffi].

#### Example

The following code produces this diagnostic because the class `S`
implements `Finalizable`:

```dart
import 'dart:ffi';

final class [!S!] extends Struct implements Finalizable {
  external Pointer notEmpty;
}
```

#### Common fixes

Try removing the implements clause from the class:

```dart
import 'dart:ffi';

final class S extends Struct {
  external Pointer notEmpty;
}
```