#### Description

The analyzer produces this diagnostic when the initializer list in a
constructor in an enum contains an invocation of a super constructor.

#### Example

The following code produces this diagnostic because the constructor in
the enum `E` has a super constructor invocation in the initializer list:

```dart
enum E {
  e;

  const E() : [!super!]();
}
```

#### Common fixes

Remove the super constructor invocation:

```dart
enum E {
  e;

  const E();
}
```