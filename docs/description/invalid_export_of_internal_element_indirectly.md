#### Description

The analyzer produces this diagnostic when a [public library][] exports a
top-level function  with a return type or at least one parameter type that
is marked with the `[internal][meta-internal]` annotation.

#### Example

Given a file named `a.dart` in the `src` directory that contains the
following:

```dart
%uri="lib/src/a.dart"
import 'package:meta/meta.dart';

@internal
typedef IntFunction = int Function();

int f(IntFunction g) => g();
```

The following code produces this diagnostic because the function `f` has a
parameter of type `IntFunction`, and `IntFunction` is only intended to be
used internally:

```dart
[!export 'src/a.dart' show f;!]
```

#### Common fixes

If the function must be public, then make all the types in the function's
signature public types.

If the function doesn't need to be exported, then stop exporting it,
either by removing it from the `show` clause, adding it to the `hide`
clause, or by removing the export.