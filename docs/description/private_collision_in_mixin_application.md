#### Description

The analyzer produces this diagnostic when two mixins that define the same
private member are used together in a single class in a library other than
the one that defines the mixins.

#### Example

Given a file named `a.dart` containing the following code:

```dart
%uri="lib/a.dart"
class A {
  void _foo() {}
}

class B {
  void _foo() {}
}
```

The following code produces this diagnostic because the classes `A` and `B`
both define the method `_foo`:

```dart
import 'a.dart';

class C extends Object with A, [!B!] {}
```

#### Common fixes

If you don't need both of the mixins, then remove one of them from the
`with` clause:

```dart
import 'a.dart';

class C extends Object with A, [!B!] {}
```

If you need both of the mixins, then rename the conflicting member in one
of the two mixins.