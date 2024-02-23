#### Description

The analyzer produces this diagnostic when an instance member that is
annotated with [`visibleForOverriding`][meta-visibleForOverriding] is
referenced outside the library in which it's declared for any reason other
than to override it.

#### Example

Given a file `a.dart` containing the following declaration:

```dart
%uri="lib/a.dart"
import 'package:meta/meta.dart';

class A {
  @visibleForOverriding
  void a() {}
}
```

The following code produces this diagnostic because the method `m` is being
invoked even though the only reason it's public is to allow it to be
overridden:

```dart
import 'a.dart';

class B extends A {
  void b() {
    [!a!]();
  }
}
```

#### Common fixes

Remove the invalid use of the member.