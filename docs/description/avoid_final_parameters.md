**AVOID** declaring parameters as final.

Declaring parameters as final can lead to unnecessarily verbose code, especially
when using the "parameter_assignments" rule.

**GOOD:**
```dart
void badParameter(String label) { // OK
  print(label);
}
```

**BAD:**
```dart
void goodParameter(final String label) { // LINT
  print(label);
}
```

**GOOD:**
```dart
void badExpression(int value) => print(value); // OK
```

**BAD:**
```dart
void goodExpression(final int value) => print(value); // LINT
```

**GOOD:**
```dart
[1, 4, 6, 8].forEach((value) => print(value + 2)); // OK
```

**BAD:**
```dart
[1, 4, 6, 8].forEach((final value) => print(value + 2)); // LINT
```

