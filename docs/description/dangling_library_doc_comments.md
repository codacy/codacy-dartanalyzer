Attach library doc comments (with `///`) to library directives, rather than
leaving them dangling near the top of a library.

**BAD:**
```dart
/// This is a great library.
import 'package:math';
```

```dart
/// This is a great library.

class C {}
```

**GOOD:**
```dart
/// This is a great library.
library;

import 'package:math';

class C {}
```

**NOTE:** An unnamed library, like `library;` above, is only supported in Dart
2.19 and later. Code which might run in earlier versions of Dart will need to
provide a name in the `library` directive.
