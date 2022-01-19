#### Description

The analyzer produces this diagnostic when a final field is initialized
twice: once where it's declared and once by a constructor's parameter.

#### Example

The following code produces this diagnostic because the field `f` is
initialized twice:

```dart
class C {
  final int f = 0;

  C(this.[!f!]);
}
```

#### Common fixes

If the field should have the same value for all instances, then remove the
initialization in the parameter list:

```dart
class C {
  final int f = 0;

  C();
}
```

If the field can have different values in different instances, then remove
the initialization in the declaration:

```dart
class C {
  final int f;

  C(this.f);
}
```