
**AVOID** using `forEach` with a function literal.

**BAD:**
```dart
people.forEach((person) {
  ...
});
```

**GOOD:**
```dart
for (var person in people) {
  ...
}

people.forEach(print);
```
