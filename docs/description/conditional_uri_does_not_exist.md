
**DON'T** reference files that do not exist in conditional imports.

Code may fail at runtime if the condition evaluates such that the missing file
needs to be imported.

**BAD:**
```dart
import 'file_that_does_exist.dart'
  if (condition) 'file_that_does_not_exist.dart';
```

**GOOD:**
```dart
import 'file_that_does_exist.dart'
  if (condition) 'file_that_also_does_exist.dart';
```

