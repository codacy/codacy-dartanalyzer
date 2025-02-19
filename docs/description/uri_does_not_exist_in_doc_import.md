#### Description

The analyzer produces this diagnostic when a doc-import is found where
the URI refers to a file that doesn't exist.

#### Examples

If the file `lib.dart` doesn't exist, the following code produces this
diagnostic:

```dart
/// @docImport [!'lib.dart'!];
library;
```

#### Common fixes

If the URI was mistyped or invalid, then correct the URI.

If the URI is correct, then create the file.