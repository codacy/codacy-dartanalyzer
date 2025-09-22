#### Description

The analyzer produces this diagnostic when anything other than a
`Future`-returning function or a `Future`-typed field or top-level
variable is annotated with [`awaitNotRequired`][meta-awaitNotRequired].

#### Example

The following code produces this diagnostic because the annotation is on a
`void`-returning function:

```dart
import 'package:meta/meta.dart';

@[!awaitNotRequired!]
void f() {}
```

#### Common fixes

Remove the annotation:

```dart
void f() {}
```