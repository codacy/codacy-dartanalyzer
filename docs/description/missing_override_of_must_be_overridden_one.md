#### Description

The analyzer produces this diagnostic when an instance member that has the
`@mustBeOverridden` annotation isn't overridden in a subclass.

#### Example

The following code produces this diagnostic because the class `B` doesn't
have an override of the inherited method `A.m` when `A.m` is annotated
with `@mustBeOverridden`:

```dart
import 'package:meta/meta.dart';

class A {
  @mustBeOverridden
  void m() {}
}

class [!B!] extends A {}
```

#### Common fixes

If the annotation is appropriate for the member, then override the member
in the subclass:

```dart
import 'package:meta/meta.dart';

class A {
  @mustBeOverridden
  void m() {}
}

class B extends A {
  @override
  void m() {}
}
```

If the annotation isn't appropriate for the member, then remove the
annotation:

```dart
class A {
  void m() {}
}

class B extends A {}
```