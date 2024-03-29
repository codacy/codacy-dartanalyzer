#### Description

The analyzer produces this diagnostic when a class extends any FFI class
other than `Struct` or `Union`, or implements or mixes in any FFI class.
`Struct` and `Union` are the only FFI classes that can be subtyped, and
then only by extending them.

For more information about FFI, see [C interop using dart:ffi][ffi].

#### Example

The following code produces this diagnostic because the class `C` extends
`Double`:

```dart
import 'dart:ffi';

final class C extends [!Double!] {}
```

#### Common fixes

If the class should extend either `Struct` or `Union`, then change the
declaration of the class:

```dart
import 'dart:ffi';

final class C extends Struct {
  @Int32()
  external int i;
}
```

If the class shouldn't extend either `Struct` or `Union`, then remove any
references to FFI classes:

```dart
final class C {}
```