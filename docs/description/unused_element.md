#### Description

The analyzer produces this diagnostic when a private declaration isn't
referenced in the library that contains the declaration. The following
kinds of declarations are analyzed:
- Private top-level declarations, such as classes, enums, mixins, typedefs,
  top-level variables, and top-level functions
- Private static and instance methods
- Optional parameters of private functions for which a value is never
  passed, even when the parameter doesn't have a private name

#### Example

Assuming that no code in the library references `_C`, the following code
produces this diagnostic:

```dart
class [!_C!] {}
```

Assuming that no code in the library passes a value for `y` in any
invocation of `_m`, the following code produces this diagnostic:

```dart
%language=2.9
class C {
  void _m(int x, [int [!y!]]) {}

  void n() => _m(0);
}
```

#### Common fixes

If the declaration isn't needed, then remove it:

```dart
class C {
  void _m(int x) {}

  void n() => _m(0);
}
```

If the declaration is intended to be used, then add the code to use it.