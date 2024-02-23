#### Description

The analyzer produces this diagnostic when an instance field in an enum
isn't marked as `final`.

#### Example

The following code produces this diagnostic because the field `f` isn't a
final field:

```dart
enum E {
  c;

  int [!f!] = 0;
}
```

#### Common fixes

If the field must be defined for the enum, then mark the field as being
`final`:

```dart
enum E {
  c;

  final int f = 0;
}
```

If the field can be removed, then remove it:

```dart
enum E {
  c
}
```