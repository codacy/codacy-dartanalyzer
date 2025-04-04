#### Description

The analyzer produces this diagnostic when either the `visibleForTemplate`
or [`visibleForTesting`][meta-visibleForTesting] annotation is applied to
a non-public declaration.

#### Example

The following code produces this diagnostic:

```dart
import 'package:meta/meta.dart';

@[!visibleForTesting!]
void _someFunction() {}

void f() => _someFunction();
```

#### Common fixes

If the declaration doesn't need to be used by test code, then remove the
annotation:

```dart
void _someFunction() {}

void f() => _someFunction();
```

If it does, then make it public:

```dart
import 'package:meta/meta.dart';

@visibleForTesting
void someFunction() {}

void f() => someFunction();
```