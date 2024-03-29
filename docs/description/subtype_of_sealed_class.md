#### Description

The analyzer produces this diagnostic when a sealed class (one that either
has the [`sealed`][meta-sealed] annotation or inherits or mixes in a
sealed class) is referenced in either the `extends`, `implements`, or
`with` clause of a class or mixin declaration if the declaration isn't in
the same package as the sealed class.

#### Example

Given a library in a package other than the package being analyzed that
contains the following:

```dart
%uri="package:a/a.dart"
import 'package:meta/meta.dart';

class A {}

@sealed
class B {}
```

The following code produces this diagnostic because `C`, which isn't in the
same package as `B`, is extending the sealed class `B`:

```dart
import 'package:a/a.dart';

[!class C extends B {}!]
```

#### Common fixes

If the class doesn't need to be a subtype of the sealed class, then change
the declaration so that it isn't:

```dart
import 'package:a/a.dart';

class B extends A {}
```

If the class needs to be a subtype of the sealed class, then either change
the sealed class so that it's no longer sealed or move the subclass into
the same package as the sealed class.