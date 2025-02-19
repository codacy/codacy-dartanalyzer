#### Description

The analyzer produces this diagnostic when an enum declaration defines a
member named `values`, whether the member is an enum value, an instance
member, or a static member.

Any such member conflicts with the implicit declaration of the static
getter named `values` that returns a list containing all the enum
constants.

#### Example

The following code produces this diagnostic because the enum `E` defines
an instance member named `values`:

```dart
enum E {
  v;
  void [!values!]() {}
}
```

#### Common fixes

Change the name of the conflicting member:

```dart
enum E {
  v;
  void getValues() {}
}
```