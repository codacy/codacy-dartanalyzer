#### Description

The analyzer produces this diagnostic when a [public library][] exports a
declaration that is marked with the [`internal`][meta-internal]
annotation.

#### Example

Given a file `a.dart` in the `src` directory that contains:

```dart
%uri="lib/src/a.dart"
import 'package:meta/meta.dart';

@internal class One {}
```

The following code, when found in a [public library][] produces this
diagnostic because the `export` directive is exporting a name that is only
intended to be used internally:

```dart
[!export 'src/a.dart';!]
```

#### Common fixes

If the export is needed, then add a `hide` clause to hide the internal
names:

```dart
export 'src/a.dart' hide One;
```

If the export isn't needed, then remove it.