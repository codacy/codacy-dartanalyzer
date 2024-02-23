#### Description

The analyzer produces this diagnostic when the name following the `is` in a
type test expression isn't defined.

#### Example

The following code produces this diagnostic because the name `Srting` isn't
defined:

```dart
void f(Object o) {
  if (o is [!Srting!]) {
    // ...
  }
}
```

#### Common fixes

Replace the name with the name of a type:

```dart
void f(Object o) {
  if (o is String) {
    // ...
  }
}
```