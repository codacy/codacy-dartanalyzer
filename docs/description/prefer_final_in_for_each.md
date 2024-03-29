**DO** prefer declaring for-each loop variables as final if they are not
reassigned later in the code.

Declaring for-each loop variables as final when possible is a good practice
because it helps avoid accidental reassignments and allows the compiler to do
optimizations.

**BAD:**
```dart
for (var element in elements) { // LINT
  print('Element: $element');
}
```

**GOOD:**
```dart
for (final element in elements) {
  print('Element: $element');
}
```

**GOOD:**
```dart
for (var element in elements) {
  element = element + element;
  print('Element: $element');
}
```

