#### Description

The analyzer produces this diagnostic when a variable length inline `Array`
is not the last member of a `Struct`.

For more information about FFI, see [C interop using dart:ffi][ffi].

#### Example

The following code produces this diagnostic because the field `a0` has a
type with three nested arrays, but only two dimensions are given in the
`Array` annotation:

```dart
import 'dart:ffi';

final class C extends Struct {
  [!@Array.variable()!]
  external Array<Uint8> a0;

  @Uint8()
  external int a1;
}
```

#### Common fixes

Move the variable length inline `Array` to be the last field in the struct.

```dart
import 'dart:ffi';

final class C extends Struct {
  @Uint8()
  external int a1;

  @Array.variable()
  external Array<Uint8> a0;
}
```

If the inline array has a fixed size, annotate it with the size:

```dart
import 'dart:ffi';

final class C extends Struct {
  @Array(10)
  external Array<Uint8> a0;

  @Uint8()
  external int a1;
}
```