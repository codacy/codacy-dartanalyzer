#### Description

The analyzer produces this diagnostic when a declaration other than a
class declaration has the `@sealed` annotation on it.

#### Example

The following code produces this diagnostic because the `@sealed`
annotation is on a method declaration:

```dart
import 'package:meta/meta.dart';

class A {
  @[!sealed!]
  void m() {}
}
```

#### Common fixes

Remove the annotation:

```dart
class A {
  void m() {}
}
```