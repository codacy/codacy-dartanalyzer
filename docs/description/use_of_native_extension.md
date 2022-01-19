#### Description

The analyzer produces this diagnostic when a library is imported using the
`dart-ext` scheme.

#### Example

The following code produces this diagnostic because the native library `x`
is being imported using a scheme of `dart-ext`:

```dart
import [!'dart-ext:x'!];
```

#### Common fixes

Rewrite the code to use `dart:ffi` as a way of invoking the contents of the
native library.