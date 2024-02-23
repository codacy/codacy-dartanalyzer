#### Description

The analyzer produces this diagnostic when a mixin is instantiated.

#### Example

The following code produces this diagnostic because the mixin `M` is being
instantiated:

```dart
mixin M {}

var m = [!M!]();
```

#### Common fixes

If you intend to use an instance of a class, then use the name of that
class in place of the name of the mixin.