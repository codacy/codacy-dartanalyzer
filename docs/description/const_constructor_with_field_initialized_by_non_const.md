#### Description

The analyzer produces this diagnostic when a constructor has the keyword
`const`, but a field in the class is initialized to a non-constant value.

#### Example

The following code produces this diagnostic because the field `s` is
initialized to a non-constant value:

```dart
String x = '3';
class C {
  final String s = x;
  [!const!] C();
}
```

#### Common fixes

If the field can be initialized to a constant value, then change the
initializer to a constant expression:

```dart
class C {
  final String s = '3';
  const C();
}
```

If the field can't be initialized to a constant value, then remove the
keyword `const` from the constructor:

```dart
String x = '3';
class C {
  final String s = x;
  C();
}
```