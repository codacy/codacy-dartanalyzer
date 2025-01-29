#### Description

The analyzer produces this diagnostic when a single file is referenced in
multiple part directives.

#### Example

Given a file `part.dart` containing

```dart
%uri="lib/part.dart"
part of 'test.dart';
```

The following code produces this diagnostic because the file `part.dart` is
included multiple times:

```dart
part 'part.dart';
part [!'part.dart'!];
```

#### Common fixes

Remove all except the first of the duplicated part directives:

```dart
part 'part.dart';
```