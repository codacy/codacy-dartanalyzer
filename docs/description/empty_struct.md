#### Description

The analyzer produces this diagnostic when a subclass of `Struct` or
`Union` doesn't have any fields. Having an empty `Struct` or `Union`
isn't supported.

For more information about FFI, see [C interop using dart:ffi][ffi].

#### Example

The following code produces this diagnostic because the class `C`, which
extends `Struct`, doesn't declare any fields:

```dart
import 'dart:ffi';

class [!C!] extends Struct {}
```

#### Common fixes

If the class is intended to be a struct, then declare one or more fields:

```dart
import 'dart:ffi';

class C extends Struct {
  @Int32()
  external int x;
}
```

If the class is intended to be used as a type argument to `Pointer`, then
make it a subclass of `Opaque`:

```dart
import 'dart:ffi';

class C extends Opaque {}
```

If the class isn't intended to be a struct, then remove or change the
extends clause:

```dart
class C {}
```