#### Description

The analyzer produces this diagnostic when a private declaration isn't
referenced in the library that contains the declaration. The following
kinds of declarations are analyzed:
- Private top-level declarations and all of their members
- Private members of public declarations
- Optional parameters of private functions for which a value is never
  passed

Not all references to an element will mark it as "used":
- Assigning a value to a top-level variable (with a standard `=`
  assignment, or a null-aware `??=` assignment) does not count as using
  it.
- Referring to an element in a doc comment reference does not count as
  using it.
- Referring to a class, mixin, or enum on the right side of an `is`
  expression does not count as using it.

#### Example

Assuming that no code in the library references `_C`, the following code
produces this diagnostic:

```dart
class [!_C!] {}
```

Assuming that no code in the library passes a value for `y` in any
invocation of `_m`, the following code produces this diagnostic:

```dart
class C {
  void _m(int x, [int? [!y!]]) {}

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