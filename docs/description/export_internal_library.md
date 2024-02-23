#### Description

The analyzer produces this diagnostic when it finds an export whose `dart:`
URI references an internal library.

#### Example

The following code produces this diagnostic because `_interceptors` is an
internal library:

```dart
export [!'dart:_interceptors'!];
```

#### Common fixes

Remove the export directive.