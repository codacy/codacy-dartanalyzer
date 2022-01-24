#### Description

The analyzer produces this diagnostic when an import directive is found
that is the same as an import before it in the file. The second import
doesn’t add value and should be removed.

#### Example

The following code produces this diagnostic:

```dart
import 'package:meta/meta.dart';
import [!'package:meta/meta.dart'!];

@sealed class C {}
```

#### Common fixes

Remove the unnecessary import:

```dart
import 'package:meta/meta.dart';

@sealed class C {}
```