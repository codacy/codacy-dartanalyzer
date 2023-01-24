#### Description

The analyzer produces this diagnostic when a field that's declared in a
subclass of `Struct` and has the type `Pointer` also has an annotation
associated with it.

For more information about FFI, see [C interop using dart:ffi][ffi].

#### Example

The following code produces this diagnostic because the field `p`, which
has the type `Pointer` and is declared in a subclass of `Struct`, has the
annotation `@Double()`:

```dart
import 'dart:ffi';

class C extends Struct {
  [!@Double()!]
  external Pointer<Int8> p;
}
```

#### Common fixes

Remove the annotations from the field:

```dart
import 'dart:ffi';

class C extends Struct {
  external Pointer<Int8> p;
}
```