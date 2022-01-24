#### Description

The analyzer produces this diagnostic when a declaration of the operator
`[]=` has a return type other than `void`.

#### Example

The following code produces this diagnostic because the declaration of the
operator `[]=` has a return type of `int`:

```dart
class C {
  [!int!] operator []=(int index, int value) => 0;
}
```

#### Common fixes

Change the return type to `void`:

```dart
class C {
  void operator []=(int index, int value) => 0;
}
```