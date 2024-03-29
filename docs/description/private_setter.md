#### Description

The analyzer produces this diagnostic when a private setter is used in a
library where it isn't visible.

#### Example

Given a file `a.dart` that contains the following:

```dart
%uri="lib/a.dart"
class A {
  static int _f = 0;
}
```

The following code produces this diagnostic because it references the
private setter `_f` even though the setter isn't visible:

```dart
import 'a.dart';

void f() {
  A.[!_f!] = 0;
}
```

#### Common fixes

If you're able to make the setter public, then do so:

```dart
%uri="lib/a.dart"
class A {
  static int f = 0;
}
```

If you aren't able to make the setter public, then find a different way to
implement the code.