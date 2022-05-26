#### Description

The analyzer produces this diagnostic when a field in a subclass of
`Struct` has an initializer.

For more information about FFI, see [C interop using dart:ffi][].

#### Example

The following code produces this diagnostic because the field `p` has an
initializer:

```dart
// @dart = 2.9
import 'dart:ffi';

class C extends Struct {
  Pointer [!p!] = nullptr;
}
```

#### Common fixes

Remove the initializer:

```dart
// @dart = 2.9
import 'dart:ffi';

class C extends Struct {
  Pointer p;
}
```