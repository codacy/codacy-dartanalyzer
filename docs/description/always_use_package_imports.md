**DO** avoid relative imports for files in `lib/`.

When mixing relative and absolute imports it's possible to create confusion
where the same member gets imported in two different ways. One way to avoid
that is to ensure you consistently use absolute imports for files within the
`lib/` directory.

This is the opposite of 'prefer_relative_imports'.

You can also use 'avoid_relative_lib_imports' to disallow relative imports of
files within `lib/` directory outside of it (for example `test/`).

**GOOD:**

```dart
import 'package:foo/bar.dart';

import 'package:foo/baz.dart';

import 'package:foo/src/baz.dart';
...
```

**BAD:**

```dart
import 'baz.dart';

import 'src/bag.dart'

import '../lib/baz.dart';

...
```

