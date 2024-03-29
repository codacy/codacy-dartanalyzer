**DO** depend on referenced packages.

When importing a package, add a dependency on it to your pubspec.

Depending explicitly on packages that you reference ensures they will always
exist and allows you to put a dependency constraint on them to guard you
against breaking changes.

Whether this should be a regular dependency or dev_dependency depends on if it
is referenced from a public file (one under either `lib` or `bin`), or some
other private file.

**BAD:**
```dart
import 'package:a/a.dart';
```

```yaml
dependencies:
```

**GOOD:**
```dart
import 'package:a/a.dart';
```

```yaml
dependencies:
  a: ^1.0.0
```

