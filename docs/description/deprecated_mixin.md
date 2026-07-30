#### Description

The analyzer produces this diagnostic when a mixin class annotated with
`@Deprecated.mixin` is used in the `with` clause of a class or enum
declaration. This annotation indicates that using the annotated mixin is
deprecated and will soon be removed. This change will likely be enforced
by removing the `mixin` class modifier.

#### Example

If the library `p` defines a class annotated with `@Deprecated.mixin`:

```dart
%uri="package:p/p.dart"
@Deprecated.mixin()
mixin class C {}
```

Then, in any library other than `p`, the following code produces this
diagnostic:

```dart
import 'package:p/p.dart';

class D with [!C!] {}
```

#### Common fixes

Follow any directions found in the `Deprecation.mixin` annotation.
Otherwise, remove the mixin class name from the `with` clause.

```dart
class D {}
```