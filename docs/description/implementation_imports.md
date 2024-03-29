From the the [pub package layout doc](https://dart.dev/tools/pub/package-layout#implementation-files):

**DON'T** import implementation files from another package.

The libraries inside `lib` are publicly visible: other packages are free to
import them.  But much of a package's code is internal implementation libraries
that should only be imported and used by the package itself.  Those go inside a
subdirectory of `lib` called `src`.  You can create subdirectories in there if
it helps you organize things.

You are free to import libraries that live in `lib/src` from within other Dart
code in the same package (like other libraries in `lib`, scripts in `bin`,
and tests) but you should never import from another package's `lib/src`
directory.  Those files are not part of the package's public API, and they
might change in ways that could break your code.

**BAD:**
```dart
// In 'road_runner'
import 'package:acme/lib/src/internals.dart;
```

