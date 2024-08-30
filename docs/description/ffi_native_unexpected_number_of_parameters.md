#### Description

The analyzer produces this diagnostic when the number of parameters in the
function type used as a type argument for the `@Native` annotation doesn't
match the number of parameters in the function being annotated.

#### Example

The following code produces this diagnostic because the function type used
as a type argument for the `@Native` annotation (`Void Function(Double)`)
has one argument and the type of the annotated function
(`void f(double, double)`) has two arguments:

```dart
import 'dart:ffi';

@Native<Void Function(Double)>(symbol: 'f')
external void [!f!](double x, double y);
```

#### Common fixes

If the annotated function is correct, then update the function type in the
`@Native` annotation to match:

```dart
import 'dart:ffi';

@Native<Void Function(Double, Double)>(symbol: 'f')
external void f(double x, double y);
```

If the function type in the `@Native` annotation is correct, then update
the annotated function to match:

```dart
import 'dart:ffi';

@Native<Void Function(Double)>(symbol: 'f')
external void f(double x);
```
TODO(brianwilkerson): Fix error range