**DO** prefix library names with the package name and a dot-separated path.

This guideline helps avoid the warnings you get when two libraries have the same
name.  Here are the rules we recommend:

* Prefix all library names with the package name.
* Make the entry library have the same name as the package.
* For all other libraries in a package, after the package name add the
dot-separated path to the library's Dart file.
* For libraries under `lib`, omit the top directory name.

For example, say the package name is `my_package`.  Here are the library names
for various files in the package:

**GOOD:**
```dart
// In lib/my_package.dart
library my_package;

// In lib/other.dart
library my_package.other;

// In lib/foo/bar.dart
library my_package.foo.bar;

// In example/foo/bar.dart
library my_package.example.foo.bar;

// In lib/src/private.dart
library my_package.src.private;
```

