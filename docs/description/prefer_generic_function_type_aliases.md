**PREFER** generic function type aliases.

With the introduction of generic functions, function type aliases
(`typedef void F()`) couldn't express all of the possible kinds of
parameterization that users might want to express. Generic function type aliases
(`typedef F = void Function()`) fixed that issue.

For consistency and readability reasons, it's better to only use one syntax and
thus prefer generic function type aliases.

**BAD:**
```dart
typedef void F();
```

**GOOD:**
```dart
typedef F = void Function();
```

