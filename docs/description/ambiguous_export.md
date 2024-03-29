#### Description

The analyzer produces this diagnostic when two or more export directives
cause the same name to be exported from multiple libraries.

#### Example

Given a file `a.dart` containing

```dart
%uri="lib/a.dart"
class C {}
```

And a file `b.dart` containing

```dart
%uri="lib/b.dart"
class C {}
```

The following code produces this diagnostic because the name `C` is being
exported from both `a.dart` and `b.dart`:

```dart
export 'a.dart';
export [!'b.dart'!];
```

#### Common fixes

If none of the names in one of the libraries needs to be exported, then
remove the unnecessary export directives:

```dart
export 'a.dart';
```

If all of the export directives are needed, then hide the name in all
except one of the directives:

```dart
export 'a.dart';
export 'b.dart' hide C;
```