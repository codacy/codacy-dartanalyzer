#### Description

The analyzer produces this diagnostic when a method that overrides a method
that is annotated as [`mustCallSuper`][meta-mustCallSuper] doesn't invoke
the overridden method as required.

#### Example

The following code produces this diagnostic because the method `m` in `B`
doesn't invoke the overridden method `m` in `A`:

```dart
import 'package:meta/meta.dart';

class A {
  @mustCallSuper
  m() {}
}

class B extends A {
  @override
  [!m!]() {}
}
```

#### Common fixes

Add an invocation of the overridden method in the overriding method:

```dart
import 'package:meta/meta.dart';

class A {
  @mustCallSuper
  m() {}
}

class B extends A {
  @override
  m() {
    super.m();
  }
}
```