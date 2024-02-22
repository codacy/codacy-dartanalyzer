**DON'T** create a lambda when a tear-off will do.

**BAD:**
```dart
names.forEach((name) {
  print(name);
});
```

**GOOD:**
```dart
names.forEach(print);
```

