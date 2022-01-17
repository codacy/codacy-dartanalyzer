
**AVOID** private typedef functions used only once. Prefer inline function
syntax.

**BAD:**
```dart
typedef void _F();
m(_F f);
```

**GOOD:**
```dart
m(void Function() f);
```

