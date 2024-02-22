Avoid null aware operators for members defined in an extension on a nullable type.

**BAD:**

```dart
extension E on int? {
  int m() => 1;
}
f(int? i) => i?.m();
```

**GOOD:**

```dart
extension E on int? {
  int m() => 1;
}
f(int? i) => i.m();
```

