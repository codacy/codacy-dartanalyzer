**DON'T** create recursive getters.

Recursive getters are getters which return themselves as a value.  This is
usually a typo.

**BAD:**
```dart
int get field => field; // LINT
```

**BAD:**
```dart
int get otherField {
  return otherField; // LINT
}
```

**GOOD:**
```dart
int get field => _field;
```

