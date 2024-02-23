#### Description

The analyzer produces this diagnostic when a generic function type has a
function-valued parameter that is written using the older inline function
type syntax.

#### Example

The following code produces this diagnostic because the parameter `f`, in
the generic function type used to define `F`, uses the inline function
type syntax:

```dart
typedef F = int Function(int f[!(!]String s));
```

#### Common fixes

Use the generic function syntax for the parameter's type:

```dart
typedef F = int Function(int Function(String));
```