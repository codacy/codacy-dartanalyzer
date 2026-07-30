#### Description

The analyzer produces this diagnostic when a private field is declared in
a primary constructor but never read, even if it's written in one or more
places.

#### Example

The following code produces this diagnostic because the field
`_i` isn't read anywhere in the library:

```dart
class C(final int [!_i!]);
```

The primary constructor declares a field because the keyword `final` is
used. (Using the `var` keyword also declares a field.)

#### Common fixes

If the parameter is still necessary, but the associated field is not, then
remove the `final` or `var` keyword:

```dart
class C(int _i);
```

If the parameter is also unnecessary, then remove it (which also removes
the associated field).

```dart
class C {}
```

If the field was intended to be used, then add the missing code.