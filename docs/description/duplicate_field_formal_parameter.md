#### Description

The analyzer produces this diagnostic when there's more than one field
formal parameter for the same field in a constructor's parameter list. It
isn't useful to assign a value that will immediately be overwritten.

#### Example

The following code produces this diagnostic because `this.f` appears twice
in the parameter list:

```dart
class C {
  int f;

  C(this.f, this.[!f!]) {}
}
```

#### Common fixes

Remove one of the field formal parameters:

```dart
class C {
  int f;

  C(this.f) {}
}
```