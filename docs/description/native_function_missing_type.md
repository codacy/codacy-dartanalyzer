#### Description

The analyzer produces this diagnostic when a `@Native`-annotated function
requires a type hint on the annotation to infer the native function type.

Dart types like `int` and `double` have multiple possible native
representations. Since the native type needs to be known at compile time
to generate correct bindings and call instructions for the function, an
explicit type must be given.

For more information about FFI, see [C interop using dart:ffi][ffi].

#### Example

The following code produces this diagnostic because the function `f()` has
the return type `int`, but doesn't have an explicit type parameter on the
`Native` annotation:

```dart
import 'dart:ffi';

@Native()
external int [!f!]();
```

#### Common fixes

Add the corresponding type to the annotation. For instance, if `f()` was
declared to return an `int32_t` in C, the Dart function should be declared
as:

```dart
import 'dart:ffi';

@Native<Int32 Function()>()
external int f();
```