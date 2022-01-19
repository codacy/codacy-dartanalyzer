#### Description

The analyzer produces this diagnostic when it finds an import whose `dart:`
URI references an internal library.

#### Example

The following code produces this diagnostic because `_interceptors` is an
internal library:

```dart
import [!'dart:_interceptors'!];
```

#### Common fixes

Remove the import directive.