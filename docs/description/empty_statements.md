**AVOID** empty statements.

Empty statements almost always indicate a bug.

For example,

**BAD:**
```dart
if (complicated.expression.foo());
  bar();
```

Formatted with `dart format` the bug becomes obvious:

```dart
if (complicated.expression.foo()) ;
bar();

```

Better to avoid the empty statement altogether.

**GOOD:**
```dart
if (complicated.expression.foo())
  bar();
```

