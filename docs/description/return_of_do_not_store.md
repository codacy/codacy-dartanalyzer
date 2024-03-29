#### Description

The analyzer produces this diagnostic when a value that is annotated with
the [`doNotStore`][meta-doNotStore] annotation is returned from a method,
getter, or function that doesn't have the same annotation.

#### Example

The following code produces this diagnostic because the result of invoking
`f` shouldn't be stored, but the function `g` isn't annotated to preserve
that semantic:

```dart
import 'package:meta/meta.dart';

@doNotStore
int f() => 0;

int g() => [!f()!];
```

#### Common fixes

If the value that shouldn't be stored is the correct value to return, then
mark the function with the [`doNotStore`][meta-doNotStore] annotation:

```dart
import 'package:meta/meta.dart';

@doNotStore
int f() => 0;

@doNotStore
int g() => f();
```

Otherwise, return a different value from the function:

```dart
import 'package:meta/meta.dart';

@doNotStore
int f() => 0;

int g() => 0;
```