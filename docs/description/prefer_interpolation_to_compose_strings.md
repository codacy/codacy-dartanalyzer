**PREFER** using interpolation to compose strings and values.

Using interpolation when composing strings and values is usually easier to write
and read than concatenation.

**BAD:**
```dart
'Hello, ' + person.name + ' from ' + person.city + '.';
```

**GOOD:**
```dart
'Hello, ${person.name} from ${person.city}.'
```

