#### Description

The analyzer produces this diagnostic when an export directive is found
that is the same as an export before it in the file. The second export
doesn't add value and should be removed.

#### Example

The following code produces this diagnostic because the same library is
being exported twice:

```dart
export 'package:meta/meta.dart';
export [!'package:meta/meta.dart'!];
```

#### Common fixes

Remove the unnecessary export:

```dart
export 'package:meta/meta.dart';
```