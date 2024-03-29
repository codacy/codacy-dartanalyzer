**DO** name libraries using `lowercase_with_underscores`.

Some file systems are not case-sensitive, so many projects require filenames to
be all lowercase. Using a separating character allows names to still be readable
in that form. Using underscores as the separator ensures that the name is still
a valid Dart identifier, which may be helpful if the language later supports
symbolic imports.

**GOOD:**
```dart
library peg_parser;
```

**BAD:**
```dart
library peg-parser;
```

The lint `file_names` can be used to enforce the same kind of naming on the
file.

