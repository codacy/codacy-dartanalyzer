#### Description

The analyzer produces this diagnostic when a member of an enum is found
that doesn't have a concrete implementation. Enums aren't allowed to
contain abstract members.

#### Example

The following code produces this diagnostic because `m` is an abstract
method and `E` is an enum:

```dart
enum E {
  e;

  [!void m();!]
}
```

#### Common fixes

Provide an implementation for the member:

```dart
enum E {
  e;

  void m() {}
}
```