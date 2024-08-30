#### Description

The analyzer produces this diagnostic when a parameter is
annotated with the [`mustBeConst`][meta-mustBeConst] annotation and
the corresponding argument is not a constant expression.

#### Example

The following code produces this diagnostic on the invocation of
the function `f` because the value of the argument passed to the
function `g` isn't a constant:

```dart
import 'package:meta/meta.dart' show mustBeConst;

int f(int value) => g([!value!]);

int g(@mustBeConst int value) => value + 1;
```

#### Common fixes

If a suitable constant is available to use, then replace the argument
with a constant:

```dart
import 'package:meta/meta.dart' show mustBeConst;

const v = 3;

int f() => g(v);

int g(@mustBeConst int value) => value + 1;
```