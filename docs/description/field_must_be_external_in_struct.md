#### Description

The analyzer produces this diagnostic when a field in a subclass of either
`Struct` or `Union` isn't marked as being `external`.

For more information about FFI, see [C interop using dart:ffi][ffi].

#### Example

The following code produces this diagnostic because the field `a` isn't
marked as being `external`:

```dart
import 'dart:ffi';

final class C extends Struct {
  @Int16()
  int [!a!];
}
```

#### Common fixes

Add the required `external` modifier:

```dart
import 'dart:ffi';

final class C extends Struct {
  @Int16()
  external int a;
}
```