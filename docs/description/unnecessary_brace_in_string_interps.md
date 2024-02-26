**AVOID** using braces in interpolation when not needed.

If you're just interpolating a simple identifier, and it's not immediately
followed by more alphanumeric text, the `{}` can and should be omitted.

**GOOD:**
```dart
print("Hi, $name!");
```

**BAD:**
```dart
print("Hi, ${name}!");
```

