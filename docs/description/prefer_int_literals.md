**DO** use int literals rather than the corresponding double literal.

**BAD:**
```dart
const double myDouble = 8.0;
final anotherDouble = myDouble + 7.0e2;
main() {
  someMethod(6.0);
}
```

**GOOD:**
```dart
const double myDouble = 8;
final anotherDouble = myDouble + 700;
main() {
  someMethod(6);
}
```

