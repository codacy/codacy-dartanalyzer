#### Description

The analyzer produces this diagnostic when the type arguments to a method
are required to be known at compile time, but a type parameter, whose
value can't be known at compile time, is used as a type argument.

For more information about FFI, see [C interop using dart:ffi][ffi].

#### Example

The following code produces this diagnostic because the type argument to
`Pointer.asFunction` must be known at compile time, but the type parameter
`R`, which isn't known at compile time, is being used as the type
argument:

```dart
import 'dart:ffi';

typedef T = int Function(int);

class C<R extends T> {
  void m(Pointer<NativeFunction<T>> p) {
    p.asFunction<[!R!]>();
  }
}
```

#### Common fixes

Remove any uses of type parameters:

```dart
import 'dart:ffi';

class C {
  void m(Pointer<NativeFunction<Int64 Function(Int64)>> p) {
    p.asFunction<int Function(int)>();
  }
}
```