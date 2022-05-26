#### Description

The analyzer produces this diagnostic when a constructor in a subclass of
either `Struct` or `Union` has one or more field initializers.

For more information about FFI, see [C interop using dart:ffi][].

#### Example

The following code produces this diagnostic because the class `C` has a
constructor with an initializer for the field `f`:

```dart
// @dart = 2.9
import 'dart:ffi';

class C extends Struct {
  @Int32()
  int f;

  C() : [!f = 0!];
}
```

#### Common fixes

Remove the field initializer:

```dart
// @dart = 2.9
import 'dart:ffi';

class C extends Struct {
  @Int32()
  int f;

  C();
}
```