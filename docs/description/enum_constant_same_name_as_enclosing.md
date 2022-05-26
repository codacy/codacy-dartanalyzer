#### Description

The analyzer produces this diagnostic when an enum constant has the same
name as the enum in which it's declared.

#### Example

The following code produces this diagnostic because the enum constant `E`
has the same name as the enclosing enum `E`:

```dart
enum E {
  [!E!]
}
```

#### Common fixes

If the name of the enum is correct, then rename the constant:

```dart
enum E {
  e
}
```

If the name of the constant is correct, then rename the enum:

```dart
enum F {
  E
}
```