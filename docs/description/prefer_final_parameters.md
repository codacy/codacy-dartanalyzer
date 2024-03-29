**DO** prefer declaring parameters as final if they are not reassigned in
the function body.

Declaring parameters as final when possible is a good practice because it helps
avoid accidental reassignments.

**BAD:**
```dart
void badParameter(String label) { // LINT
  print(label);
}
```

**GOOD:**
```dart
void goodParameter(final String label) { // OK
  print(label);
}
```

**BAD:**
```dart
void badExpression(int value) => print(value); // LINT
```

**GOOD:**
```dart
void goodExpression(final int value) => print(value); // OK
```

**BAD:**
```dart
[1, 4, 6, 8].forEach((value) => print(value + 2)); // LINT
```

**GOOD:**
```dart
[1, 4, 6, 8].forEach((final value) => print(value + 2)); // OK
```

**GOOD:**
```dart
void mutableParameter(String label) { // OK
  print(label);
  label = 'Hello Linter!';
  print(label);
}
```

