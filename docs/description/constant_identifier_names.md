**PREFER** using lowerCamelCase for constant names.

In new code, use `lowerCamelCase` for constant variables, including enum values.

In existing code that uses `ALL_CAPS_WITH_UNDERSCORES` for constants, you may
continue to use all caps to stay consistent.

**GOOD:**
```dart
const pi = 3.14;
const defaultTimeout = 1000;
final urlScheme = RegExp('^([a-z]+):');

class Dice {
  static final numberGenerator = Random();
}
```

**BAD:**
```dart
const PI = 3.14;
const kDefaultTimeout = 1000;
final URL_SCHEME = RegExp('^([a-z]+):');

class Dice {
  static final NUMBER_GENERATOR = Random();
}

```

