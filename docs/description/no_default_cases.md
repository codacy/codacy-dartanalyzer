Switches on enums and enum-like classes should not use a `default` clause.

Enum-like classes are defined as concrete (non-abstract) classes that have:
  * only private non-factory constructors
  * two or more static const fields whose type is the enclosing class and
  * no subclasses of the class in the defining library

**DO** define default behavior outside switch statements.

**GOOD:**
```dart
  switch (testEnum) {
    case TestEnum.A:
      return '123';
    case TestEnum.B:
      return 'abc';
  }
  // Default here.
  return null;
```

**BAD:**
```dart
  switch (testEnum) {
    case TestEnum.A:
      return '123';
    case TestEnum.B:
      return 'abc';
    default:
      return null;
  }
```
