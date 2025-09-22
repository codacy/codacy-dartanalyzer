#### Description

The analyzer produces this diagnostic when a documentation import has a
prefix.

Using prefixes isn't supported for documentation imports.

#### Example

The following code produces this diagnostic because the documentation
import declares a prefix:

```dart
/// @docImport 'package:meta/meta.dart' as [!a!];
library;
```

#### Common fixes

Remove the prefix:

```dart
/// @docImport 'package:meta/meta.dart';
library;
```