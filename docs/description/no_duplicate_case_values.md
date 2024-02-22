**DON'T** use more than one case with same value.

This is usually a typo or changed value of constant.

**GOOD:**
```dart
const int A = 1;
switch (v) {
  case A:
  case 2:
}
```

**BAD:**
```dart
const int A = 1;
switch (v) {
  case 1:
  case 2:
  case A:
  case 2:
}
```

