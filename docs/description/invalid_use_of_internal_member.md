#### Description

The analyzer produces this diagnostic when a reference to a declaration
that is annotated with the [`internal`][meta-internal] annotation is found
outside the package containing the declaration.

#### Example

Given a package `p` that defines a library containing a declaration marked
with the [`internal`][meta-internal] annotation:

```dart
%uri="package:p/src/p.dart"
import 'package:meta/meta.dart';

@internal
class C {}
```

The following code produces this diagnostic because it's referencing the
class `C`, which isn't intended to be used outside the package `p`:

```dart
import 'package:p/src/p.dart';

void f([!C!] c) {}
```

#### Common fixes

Remove the reference to the internal declaration.