#### Description

The analyzer produces this diagnostic when a documentation import has one
or more `if` clauses.

Documentation imports aren't configurable.

#### Example

The following code produces this diagnostic because the documentation
import has an `if` clause:

```dart
/// @docImport 'package:meta/meta.dart' [!if (dart.library.io) 'dart:io'!];
library;
```

#### Common fixes

Remove the `if` clauses:

```dart
/// @docImport 'package:meta/meta.dart';
library;
```