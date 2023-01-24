#### Description

The analyzer produces this diagnostic when an invocation of the method
`Pointer.fromFunction` doesn't have a second argument (the exceptional
return value) when the type to be returned from the invocation is neither
`void`, `Handle`, nor `Pointer`.

For more information about FFI, see [C interop using dart:ffi][ffi].

#### Example

The following code produces this diagnostic because the type returned by
`f` is expected to be an 8-bit integer but the call to `fromFunction`
doesn't include an exceptional return argument:

```dart
import 'dart:ffi';

int f(int i) => i * 2;

void g() {
  Pointer.[!fromFunction!]<Int8 Function(Int8)>(f);
}
```

#### Common fixes

Add an exceptional return type:

```dart
import 'dart:ffi';

int f(int i) => i * 2;

void g() {
  Pointer.fromFunction<Int8 Function(Int8)>(f, 0);
}
```