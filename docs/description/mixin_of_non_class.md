#### Description

The analyzer produces this diagnostic when a name in a `with` clause is
defined to be something other than a mixin or a class.

#### Example

The following code produces this diagnostic because `F` is defined to be a
function type:

```dart
typedef F = int Function(String);

class C with [!F!] {}
```

#### Common fixes

Remove the invalid name from the list, possibly replacing it with the name
of the intended mixin or class:

```dart
typedef F = int Function(String);

class C {}
```