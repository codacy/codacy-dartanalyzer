#### Description

The analyzer produces this diagnostic when the value of a function
(including methods and getters) that is explicitly or implicitly marked by
the [`doNotStore`][meta-doNotStore] annotation is stored in either a field
or top-level variable.

#### Example

The following code produces this diagnostic because the value of the
function `f` is being stored in the top-level variable `x`:

```dart
import 'package:meta/meta.dart';

@doNotStore
int f() => 1;

var x = [!f()!];
```

#### Common fixes

Replace references to the field or variable with invocations of the
function producing the value.