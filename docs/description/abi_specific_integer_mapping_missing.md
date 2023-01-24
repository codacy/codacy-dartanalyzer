#### Description

The analyzer produces this diagnostic when a class that extends
`AbiSpecificInteger` doesn't have an `AbiSpecificIntegerMapping`
annotation.

#### Example

The following code produces this diagnostic because there's no
`AbiSpecificIntegerMapping` annotation on the class `C`:

```dart
import 'dart:ffi';

class [!C!] extends AbiSpecificInteger {
  const C();
}
```

#### Common fixes

Add an `AbiSpecificIntegerMapping` annotation to the class:

```dart
import 'dart:ffi';

@AbiSpecificIntegerMapping({Abi.macosX64 : Int8()})
class C extends AbiSpecificInteger {
  const C();
}
```