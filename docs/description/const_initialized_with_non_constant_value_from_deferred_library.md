#### Description

The analyzer produces this diagnostic when a `const` variable is
initialized using a `const` variable from a library that is imported using
a deferred import. Constants are evaluated at compile time, and values from
deferred libraries aren't available at compile time.

For more information, see the language tour's coverage of
[deferred loading](https://dart.dev/guides/language/language-tour#lazily-loading-a-library).

#### Example

The following code produces this diagnostic because the variable `pi` is
being initialized using the constant `math.pi` from the library
`dart:math`, and `dart:math` is imported as a deferred library:

```dart
import 'dart:math' deferred as math;

const pi = [!math.pi!];
```

#### Common fixes

If you need to reference the value of the constant from the imported
library, then remove the keyword `deferred`:

```dart
import 'dart:math' as math;

const pi = math.pi;
```

If you don't need to reference the imported constant, then remove the
reference:

```dart
const pi = 3.14;
```