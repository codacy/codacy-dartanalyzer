
**PREFER** using interpolation to compose strings and values.

Using interpolation when composing strings and values is usually easier to write
and read than concatenation.

**BAD:**
```dart
'Hello, ' + name + '! You are ' + (year - birth) + ' years old.';
```

**GOOD:**
```dart
'Hello, $name! You are ${year - birth} years old.';
```

