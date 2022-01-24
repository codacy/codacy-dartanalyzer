#### Description

The analyzer produces this diagnostic when a field formal parameter is
found in a constructor in a class that doesn't declare the field being
initialized. Constructors can't initialize fields that aren't declared and
fields that are inherited from superclasses.

#### Example

The following code produces this diagnostic because the field `x` isn't
defined:

```dart
%language=2.9
class C {
  int y;

  C([!this.x!]);
}
```

#### Common fixes

If the field name was wrong, then change it to the name of an existing
field:

```dart
%language=2.9
class C {
  int y;

  C(this.y);
}
```

If the field name is correct but hasn't yet been defined, then declare the
field:

```dart
%language=2.9
class C {
  int x;
  int y;

  C(this.x);
}
```

If the parameter is needed but shouldn't initialize a field, then convert
it to a normal parameter and use it:

```dart
%language=2.9
class C {
  int y;

  C(int x) : y = x * 2;
}
```

If the parameter isn't needed, then remove it:

```dart
%language=2.9
class C {
  int y;

  C();
}
```