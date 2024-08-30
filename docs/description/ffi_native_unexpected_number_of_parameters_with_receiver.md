#### Description

The analyzer produces this diagnostic when the type argument used on the
`@Native` annotation of a native method doesn't include a type for the
receiver of the method.

#### Example

The following code produces this diagnostic because the type argument on
the `@Native` annotation (`Void Function(Double)`) doesn't include a type
for the receiver of the method:

```dart
import 'dart:ffi';

class C {
  @Native<Void Function(Double)>()
  external void [!f!](double x);
}
```

#### Common fixes

Add an initial parameter whose type is the same as the class in which the
native method is being declared:

```dart
import 'dart:ffi';

class C {
  @Native<Void Function(C, Double)>()
  external void f(double x);
}
```