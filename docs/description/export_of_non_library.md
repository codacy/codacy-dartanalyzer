#### Description

The analyzer produces this diagnostic when an export directive references a
part rather than a library.

#### Example

Given a file named `part.dart` containing

```dart
%uri="lib/part.dart"
part of lib;
```

The following code produces this diagnostic because the file `part.dart` is
a part, and only libraries can be exported:

```dart
library lib;

export [!'part.dart'!];
```

#### Common fixes

Either remove the export directive, or change the URI to be the URI of the
library containing the part.