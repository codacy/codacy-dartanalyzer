**PREFER** relative imports for files in `lib/`.

When mixing relative and absolute imports it's possible to create confusion
where the same member gets imported in two different ways. One way to avoid
that is to ensure you consistently use relative imports for files within the
`lib/` directory.

**GOOD:**

```dart
import 'bar.dart';
```

**BAD:**

```dart
import 'package:my_package/bar.dart';
```

