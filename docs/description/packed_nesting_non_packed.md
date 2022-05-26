#### Description

The analyzer produces this diagnostic when a subclass of `Struct` that is
annotated as being `Packed` declares a field whose type is also a subclass
of `Struct` and the field's type is either not packed or is packed less
tightly.

For more information about FFI, see [C interop using dart:ffi][].

#### Example

The following code produces this diagnostic because the class `Outer`,
which is a subclass of `Struct` and is packed on 1-byte boundaries,
declared a field whose type (`Inner`) is packed on 8-byte boundaries:

```dart
import 'dart:ffi';

@Packed(8)
class Inner extends Struct {
  external Pointer<Uint8> notEmpty;
}

@Packed(1)
class Outer extends Struct {
  external Pointer<Uint8> notEmpty;

  external [!Inner!] nestedLooselyPacked;
}
```

#### Common fixes

If the inner struct should be packed more tightly, then change the
argument to the inner struct's `Packed` annotation:

```dart
import 'dart:ffi';

@Packed(1)
class Inner extends Struct {
  external Pointer<Uint8> notEmpty;
}

@Packed(1)
class Outer extends Struct {
  external Pointer<Uint8> notEmpty;

  external Inner nestedLooselyPacked;
}
```

If the outer struct should be packed less tightly, then change the
argument to the outer struct's `Packed` annotation:

```dart
import 'dart:ffi';

@Packed(8)
class Inner extends Struct {
  external Pointer<Uint8> notEmpty;
}

@Packed(8)
class Outer extends Struct {
  external Pointer<Uint8> notEmpty;

  external Inner nestedLooselyPacked;
}
```

If the inner struct doesn't have an annotation and should be packed, then
add an annotation.

If the inner struct doesn't have an annotation and the outer struct
shouldn't be packed, then remove its annotation.