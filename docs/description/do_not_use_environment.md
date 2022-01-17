Using values derived from the environment at compile-time, creates
hidden global state and makes applications hard to understand and maintain.

**DO NOT** use `fromEnvironment` or `hasEnvironment` factory constructors.

**BAD:**
```dart
const loggingLevel =
  bool.hasEnvironment('logging') ? String.fromEnvironment('logging') : null;
```
