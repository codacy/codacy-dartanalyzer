Attach library annotations to library directives, rather than
some other library-level element.

**BAD:**
```dart
import 'package:test/test.dart';

@TestOn('browser')
void main() {}
```

**GOOD:**
```dart
@TestOn('browser')
library;
import 'package:test/test.dart';

void main() {}
```

**NOTE:** An unnamed library, like `library;` above, is only supported in Dart
2.19 and later. Code which might run in earlier versions of Dart will need to
provide a name in the `library` directive.
