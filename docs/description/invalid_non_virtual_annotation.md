#### Description

The analyzer produces this diagnostic when the `nonVirtual` annotation is
found on a declaration other than a member of a class, mixin, or enum, or
if the member isn't a concrete instance member.

#### Examples

The following code produces this diagnostic because the method `m` is an
abstract method:

```dart
import 'package:meta/meta.dart';

abstract class C {
  @[!nonVirtual!]
  void m();
}
```

#### Common fixes

If the member is intended to be a concrete instance member, then make it
so:

```dart
import 'package:meta/meta.dart';

abstract class C {
  @nonVirtual
  void m() {}
}
```