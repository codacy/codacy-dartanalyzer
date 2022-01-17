*DO* avoid relative imports for files in `lib/`.

When mixing relative and absolute imports it's possible to create confusion
where the same member gets imported in two different ways.  An easy way to avoid
that is to ensure you have no relative imports that include `lib/` in their
paths.

**GOOD:**

```dart
import 'package:foo/bar.dart';

import 'baz.dart';

...
```

**BAD:**

```dart
import 'package:foo/bar.dart';

import '../lib/baz.dart';

...
```

