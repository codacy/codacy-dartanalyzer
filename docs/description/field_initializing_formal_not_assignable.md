#### Description

The analyzer produces this diagnostic when the type of a field formal
parameter isn't assignable to the type of the field being initialized.

#### Example

The following code produces this diagnostic because the field formal
parameter has the type `String`, but the type of the field is `int`. The
parameter must have a type that is a subtype of the field's type.

```dart
class C {
  int f;

  C([!String this.f!]);
}
```

#### Common fixes

If the type of the field is incorrect, then change the type of the field to
match the type of the parameter, and consider removing the type from the
parameter:

```dart
class C {
  String f;

  C(this.f);
}
```

If the type of the parameter is incorrect, then remove the type of the
parameter:

```dart
class C {
  int f;

  C(this.f);
}
```

If the types of both the field and the parameter are correct, then use an
initializer rather than a field formal parameter to convert the parameter
value into a value of the correct type:

```dart
class C {
  int f;

  C(String s) : f = int.parse(s);
}
```