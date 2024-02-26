#### Description

The analyzer produces this diagnostic when a library that doesn't have a
`library` directive (and hence has no name) contains a `part` directive
and the `part of` directive in the [part file][] uses a name to specify
the library that it's a part of.

#### Example

Given a [part file][] named `part_file.dart` containing the following
code:

```dart
%uri="lib/part_file.dart"
part of lib;
```

The following code produces this diagnostic because the library including
the [part file][] doesn't have a name even though the [part file][] uses a
name to specify which library it's a part of:

```dart
part [!'part_file.dart'!];
```

#### Common fixes

Change the `part of` directive in the [part file][] to specify its library
by URI:

```dart
%uri="lib/part_file.dart"
part of 'test.dart';
```