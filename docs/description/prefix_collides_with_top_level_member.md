#### Description

The analyzer produces this diagnostic when a name is used as both an import
prefix and the name of a top-level declaration in the same library.

#### Example

The following code produces this diagnostic because `f` is used as both an
import prefix and the name of a function:

```dart
import 'dart:math' as f;

int [!f!]() => f.min(0, 1);
```

#### Common fixes

If you want to use the name for the import prefix, then rename the
top-level declaration:

```dart
import 'dart:math' as f;

int g() => f.min(0, 1);
```

If you want to use the name for the top-level declaration, then rename the
import prefix:

```dart
import 'dart:math' as math;

int f() => math.min(0, 1);
```