
Use if-null operators to convert nulls to bools.

**BAD:**
```dart
if (nullableBool == true) {
}
if (nullableBool != false) {
}
```

**GOOD:**
```dart
if (nullableBool ?? false) {
}
if (nullableBool ?? true) {
}
```

