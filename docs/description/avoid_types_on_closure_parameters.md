**AVOID** annotating types for function expression parameters.

Annotating types for function expression parameters is usually unnecessary
because the parameter types can almost always be inferred from the context,
thus making the practice redundant.

**BAD:**
```dart
var names = people.map((Person person) => person.name);
```

**GOOD:**
```dart
var names = people.map((person) => person.name);
```

