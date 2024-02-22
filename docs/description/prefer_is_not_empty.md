**PREFER** `x.isNotEmpty` to `!x.isEmpty` for `Iterable` and `Map` instances.

When testing whether an iterable or map is empty, prefer `isNotEmpty` over
`!isEmpty` to improve code readability.

**GOOD:**
```dart
if (todo.isNotEmpty) {
  sendResults(request, todo.isEmpty);
}
```

**BAD:**
```dart
if (!sources.isEmpty) {
  process(sources);
}
```

