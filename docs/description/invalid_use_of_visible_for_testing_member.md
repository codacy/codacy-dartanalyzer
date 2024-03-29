#### Description

The analyzer produces this diagnostic when a member annotated with
`@visibleForTesting` is referenced anywhere other than the library in
which it is declared or in a library in the `test` directory.

#### Example

Given a file `c.dart` that contains the following:

```dart
%uri="lib/c.dart"
import 'package:meta/meta.dart';

class C {
  @visibleForTesting
  void m() {}
}
```

The following code, when not inside the `test` directory, produces this
diagnostic because the method `m` is marked as being visible only for
tests:

```dart
import 'c.dart';

void f(C c) {
  c.[!m!]();
}
```

#### Common fixes

If the annotated member should not be referenced outside of tests, then
remove the reference:

```dart
import 'c.dart';

void f(C c) {}
```

If it's OK to reference the annotated member outside of tests, then remove
the annotation:

```dart
class C {
  void m() {}
}
```