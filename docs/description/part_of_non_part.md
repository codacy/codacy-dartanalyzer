#### Description

The analyzer produces this diagnostic when a part directive is found and
the referenced file doesn't have a part-of directive.

#### Example

Given a file `a.dart` containing:

```dart
%uri="lib/a.dart"
class A {}
```

The following code produces this diagnostic because `a.dart` doesn't
contain a part-of directive:

```dart
part [!'a.dart'!];
```

#### Common fixes

If the referenced file is intended to be a part of another library, then
add a part-of directive to the file:

```dart
part of 'test.dart';

class A {}
```

If the referenced file is intended to be a library, then replace the part
directive with an import directive:

```dart
import 'a.dart';
```