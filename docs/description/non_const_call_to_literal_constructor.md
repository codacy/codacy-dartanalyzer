#### Description

The analyzer produces this diagnostic when a constructor that has the
`[literal][meta-literal]` annotation is invoked without using the `const`
keyword, but all of the arguments to the constructor are constants. The
annotation indicates that the constructor should be used to create a
constant value whenever possible.

#### Example

The following code produces this diagnostic:

```dart
import 'package:meta/meta.dart';

class C {
  @literal
  const C();
}

C f() => [!C()!];
```

#### Common fixes

Add the keyword `const` before the constructor invocation:

```dart
import 'package:meta/meta.dart';

class C {
  @literal
  const C();
}

void f() => const C();
```