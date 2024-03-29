When building maps from iterables, it is preferable to use 'for' elements.

Using 'for' elements brings several benefits including:

- Performance
- Flexibility
- Readability
- Improved type inference
- Improved interaction with null safety


**BAD:**
```dart
Map<String, WidgetBuilder>.fromIterable(
  kAllGalleryDemos,
  key: (demo) => '${demo.routeName}',
  value: (demo) => demo.buildRoute,
);

```

**GOOD:**
```dart
return {
  for (var demo in kAllGalleryDemos)
    '${demo.routeName}': demo.buildRoute,
};
```

**GOOD:**
```dart
// Map<int, Student> is not required, type is inferred automatically.
final pizzaRecipients = {
  ...studentLeaders,
  for (var student in classG)
    if (student.isPassing) student.id: student,
};
```
