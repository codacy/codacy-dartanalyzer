**DON'T** use a leading underscore for library prefixes.
There is no concept of "private" for library prefixes. When one of those has a
name that starts with an underscore, it sends a confusing signal to the reader. 
To avoid that, don't use leading underscores in those names.

**BAD**
```dart
import 'dart:core' as _core;
```

**GOOD:**
```dart
import 'dart:core' as core;
```
