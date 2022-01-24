#### Description

The analyzer produces this diagnostic when a constant from a library that
is imported using a deferred import is used as an annotation. Annotations
are evaluated at compile time, and constants from deferred libraries aren't
available at compile time.

For more information, see the language tour's coverage of
[deferred loading](https://dart.dev/guides/language/language-tour#lazily-loading-a-library).

#### Example

The following code produces this diagnostic because the constant `pi` is
being used as an annotation when the library `dart:math` is imported as
`deferred`:

```dart
import 'dart:math' deferred as math;

@[!math.pi!]
void f() {}
```

#### Common fixes

If you need to reference the constant as an annotation, then remove the
keyword `deferred` from the import:

```dart
import 'dart:math' as math;

@math.pi
void f() {}
```

If you can use a different constant as an annotation, then replace the
annotation with a different constant:

```dart
@deprecated
void f() {}
```