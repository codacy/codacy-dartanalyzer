#### Description

The analyzer produces this diagnostic when a subclass of either `Struct`
or `Union` has a type parameter.

For more information about FFI, see [C interop using dart:ffi][].

#### Example

The following code produces this diagnostic because the class `S` defines
the type parameter `T`:

```dart
import 'dart:ffi';

class [!S!]<T> extends Struct {
  external Pointer notEmpty;
}
```

#### Common fixes

Remove the type parameters from the class:

```dart
import 'dart:ffi';

class S extends Struct {
  external Pointer notEmpty;
}
```