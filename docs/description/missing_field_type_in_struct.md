#### Description

The analyzer produces this diagnostic when a field in a subclass of
`Struct` or `Union` doesn't have a type annotation. Every field must have
an explicit type, and the type must either be `int`, `double`, `Pointer`,
or a subclass of either `Struct` or `Union`.

For more information about FFI, see [C interop using dart:ffi][].

#### Example

The following code produces this diagnostic because the field `str`
doesn't have a type annotation:

```dart
import 'dart:ffi';

class C extends Struct {
  external var [!str!];

  @Int32()
  external int i;
}
```

#### Common fixes

Explicitly specify the type of the field:

```dart
import 'dart:ffi';
import 'package:ffi/ffi.dart';

class C extends Struct {
  external Pointer<Utf8> str;

  @Int32()
  external int i;
}
```