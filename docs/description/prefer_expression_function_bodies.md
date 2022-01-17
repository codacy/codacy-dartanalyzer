
**CONSIDER** using => for short members whose body is a single return statement.

**BAD:**
```dart
get width {
  return right - left;
}
```

**BAD:**
```dart
bool ready(num time) {
  return minTime == null || minTime <= time;
}
```

**BAD:**
```dart
containsValue(String value) {
  return getValues().contains(value);
}
```

**GOOD:**
```dart
get width => right - left;
```

**GOOD:**
```dart
bool ready(num time) => minTime == null || minTime <= time;
```

**GOOD:**
```dart
containsValue(String value) => getValues().contains(value);
```

