#### Description

The analyzer produces this diagnostic when an import isn't needed because
all of the names that are imported and referenced within the importing
library are also visible through another import.

#### Example

Given a file `a.dart` that contains the following:

```dart
%uri="lib/a.dart"
class A {}
```

And, given a file `b.dart` that contains the following:

```dart
%uri="lib/b.dart"
export 'a.dart';

class B {}
```

The following code produces this diagnostic because the class `A`, which is
imported from `a.dart`, is also imported from `b.dart`. Removing the import
of `a.dart` leaves the semantics unchanged:

```dart
import [!'a.dart'!];
import 'b.dart';

void f(A a, B b) {}
```

#### Common fixes

If the import isn't needed, then remove it.

If some of the names imported by this import are intended to be used but
aren't yet, and if those names aren't imported by other imports, then add
the missing references to those names.