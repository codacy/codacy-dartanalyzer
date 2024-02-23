#### Description

The analyzer produces this diagnostic when a method or function can
implicitly return `null` by falling off the end. While this is valid Dart
code, it's better for the return of `null` to be explicit.

#### Example

The following code produces this diagnostic because the function `f`
implicitly returns `null`:

```dart
String? [!f!]() {}
```

#### Common fixes

If the return of `null` is intentional, then make it explicit:

```dart
String? f() {
  return null;
}
```

If the function should return a non-null value along that path, then add
the missing return statement:

```dart
String? f() {
  return '';
}
```