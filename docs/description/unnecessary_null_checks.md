
Don't apply a null check when a nullable value is accepted.

**BAD:**
```dart
f(int? i);
m() {
  int? j;
  f(j!);
}

```

**GOOD:**
```dart
f(int? i);
m() {
  int? j;
  f(j);
}
```

