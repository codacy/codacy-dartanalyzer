**AVOID** annotating with dynamic when not required.

As `dynamic` is the assumed return value of a function or method, it is usually
not necessary to annotate it.

**BAD:**
```dart
dynamic lookUpOrDefault(String name, Map map, dynamic defaultValue) {
  var value = map[name];
  if (value != null) return value;
  return defaultValue;
}
```

**GOOD:**
```dart
lookUpOrDefault(String name, Map map, defaultValue) {
  var value = map[name];
  if (value != null) return value;
  return defaultValue;
}
```

