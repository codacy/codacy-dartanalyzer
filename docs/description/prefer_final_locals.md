**DO** prefer declaring variables as final if they are not reassigned later in
the code.

Declaring variables as final when possible is a good practice because it helps
avoid accidental reassignments and allows the compiler to do optimizations.

**BAD:**
```dart
void badMethod() {
  var label = 'hola mundo! badMethod'; // LINT
  print(label);
}
```

**GOOD:**
```dart
void goodMethod() {
  final label = 'hola mundo! goodMethod';
  print(label);
}
```

**GOOD:**
```dart
void mutableCase() {
  var label = 'hola mundo! mutableCase';
  print(label);
  label = 'hello world';
  print(label);
}
```

