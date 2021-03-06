#### Description

The analyzer produces this diagnostic when a show combinator includes a
name that isn't used within the library. Because it isn't referenced, the
name can be removed.

#### Example

The following code produces this diagnostic because the function `max`
isn't used:

```dart
import 'dart:math' show min, [!max!];

var x = min(0, 1);
```

#### Common fixes

Either use the name or remove it:

```dart
import 'dart:math' show min;

var x = min(0, 1);
```