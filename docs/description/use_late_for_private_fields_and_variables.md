Use `late` for private members with non-nullable types that are always expected
to be non-null. Thus it's clear that the field is not expected to be `null`
and it avoids null checks.

**BAD:**
```dart
int? _i;
m() {
  _i!.abs();
}
```

**GOOD:**
```dart
late int _i;
m() {
  _i.abs();
}
```

**OK:**
```dart
int? _i;
m() {
  _i?.abs();
  _i = null;
}
```

