#### Description

The analyzer produces this diagnostic when the name of a named parameter
starts with an underscore and the result of removing the underscore isn't
a valid public identifier.

#### Example

The following code produces this diagnostic because the named parameter
`_2legit` without the `_` is `2legit`, which isn't a valid public
identifier:

```dart
class C {
  final int? _2legit;
  C({this.[!_2legit!] = 0});
  int? get twoLegit => _2legit;
}
```

#### Common fixes

Rename the parameter so that the character following the leading
underscore is a letter.