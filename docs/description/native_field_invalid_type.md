#### Description

The analyzer produces this diagnostic when an `@Native`-annotated field
has a type not supported for native fields.

Native fields support pointers, arrays, numeric types and subtypes of
`Compound` (i.e., structs or unions). Other subtypes of `NativeType`,
such as `Handle` or `NativeFunction` are not allowed as native fields.

Native functions should be used with external functions instead of
external fields.

Handles are unsupported because there is no way to transparently load and
store Dart objects into pointers.

For more information about FFI, see [C interop using dart:ffi][ffi].

#### Example

The following code produces this diagnostic because the field `free` uses
an unsupported native type, `NativeFunction`:

```dart
import 'dart:ffi';

@Native<NativeFunction<Void Function()>>()
external void Function() [!free!];
```

#### Common fixes

If you meant to bind to an existing native function with a
`NativeFunction` field, use `@Native` methods instead:

```dart
import 'dart:ffi';

@Native<Void Function(Pointer<Void>)>()
external void free(Pointer<Void> ptr);
```

To bind to a field storing a function pointer in C, use a pointer type
for the Dart field:

```dart
import 'dart:ffi';

@Native()
external Pointer<NativeFunction<Void Function(Pointer<Void>)>> free;
```