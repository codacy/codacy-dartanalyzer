**DO** use valid regular expression syntax when creating regular expression
instances.

Regular expressions created with invalid syntax will throw a `FormatException`
at runtime so should be avoided.

**BAD:**
```dart
print(RegExp(r'(').hasMatch('foo()'));
```

**GOOD:**
```dart
print(RegExp(r'\(').hasMatch('foo()'));
```

