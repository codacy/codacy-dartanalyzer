#### Description

The analyzer produces this diagnostic when a class extends, implements, or
mixes in a class that extends either `Struct` or `Union`. Classes can only
extend either `Struct` or `Union` directly.

For more information about FFI, see [C interop using dart:ffi][].

#### Example

The following code produces this diagnostic because the class `C` extends
`S`, and `S` extends `Struct`:

```dart
import 'dart:ffi';

class S extends Struct {
  external Pointer f;
}

class C extends [!S!] {
  external Pointer g;
}
```

#### Common fixes

If you're trying to define a struct or union that shares some fields
declared by a different struct or union, then extend `Struct` or `Union`
directly and copy the shared fields:

```dart
import 'dart:ffi';

class S extends Struct {
  external Pointer f;
}

class C extends Struct {
  external Pointer f;

  external Pointer g;
}
```