#### Description

The analyzer produces this diagnostic when a documentation import has one
or more `hide` or `show` combinators.

Using combinators isn't supported for documentation imports.

#### Example

The following code produces this diagnostic because the documentation
import has a `show` combinator:

```dart
/// @docImport 'package:meta/meta.dart' [!show max!];
library;
```

#### Common fixes

Remove the `hide` and `show` combinators:

```dart
/// @docImport 'package:meta/meta.dart';
library;
```