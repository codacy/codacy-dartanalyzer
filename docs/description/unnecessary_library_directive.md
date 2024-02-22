**DO** use library directives if you want to document a library and/or annotate 
a library.

**GOOD:**
```dart
/// This library does important things
library;
```

```dart
@TestOn('js')
library;
```

**BAD:**
```dart
library;
```

NOTE: Due to limitations with this lint, libraries with parts will not be
flagged for unnecessary library directives.
