#### Description

The analyzer produces this diagnostic when a class that extends
`AbiSpecificInteger` has more than one `AbiSpecificIntegerMapping`
annotation.

#### Example

The following code produces this diagnostic because there are two
`AbiSpecificIntegerMapping` annotations on the class `C`:

```dart
import 'dart:ffi';

@AbiSpecificIntegerMapping({Abi.macosX64 : Int8()})
@[!AbiSpecificIntegerMapping!]({Abi.linuxX64 : Uint16()})
class C extends AbiSpecificInteger {
  const C();
}
```

#### Common fixes

Remove all but one of the annotations, merging the arguments as
appropriate:

```dart
import 'dart:ffi';

@AbiSpecificIntegerMapping({Abi.macosX64 : Int8(), Abi.linuxX64 : Uint16()})
class C extends AbiSpecificInteger {
  const C();
}
```