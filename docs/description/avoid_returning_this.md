**AVOID** returning this from methods just to enable a fluent interface.

Returning `this` from a method is redundant; Dart has a cascade operator which
allows method chaining universally.

Returning `this` is allowed for:

- operators
- methods with a return type different of the current class
- methods defined in parent classes / mixins or interfaces
- methods defined in extensions

**BAD:**
```dart
var buffer = StringBuffer()
  .write('one')
  .write('two')
  .write('three');
```

**GOOD:**
```dart
var buffer = StringBuffer()
  ..write('one')
  ..write('two')
  ..write('three');
```

