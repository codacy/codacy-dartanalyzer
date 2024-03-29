**DO** follow the directive ordering conventions in
[Effective Dart](https://dart.dev/guides/language/effective-dart/style#ordering):

**DO** place `dart:` imports before other imports.

**BAD:**
```dart
import 'package:bar/bar.dart';
import 'package:foo/foo.dart';

import 'dart:async';  // LINT
import 'dart:html';  // LINT
```

**BAD:**
```dart
import 'dart:html';  // OK
import 'package:bar/bar.dart';

import 'dart:async';  // LINT
import 'package:foo/foo.dart';
```

**GOOD:**
```dart
import 'dart:async';  // OK
import 'dart:html';  // OK

import 'package:bar/bar.dart';
import 'package:foo/foo.dart';
```

**DO** place `package:` imports before relative imports.

**BAD:**
```dart
import 'a.dart';
import 'b.dart';

import 'package:bar/bar.dart';  // LINT
import 'package:foo/foo.dart';  // LINT
```

**BAD:**
```dart
import 'package:bar/bar.dart';  // OK
import 'a.dart';

import 'package:foo/foo.dart';  // LINT
import 'b.dart';
```

**GOOD:**
```dart
import 'package:bar/bar.dart';  // OK
import 'package:foo/foo.dart';  // OK

import 'a.dart';
import 'b.dart';
```

**DO** specify exports in a separate section after all imports.

**BAD:**
```dart
import 'src/error.dart';
export 'src/error.dart'; // LINT
import 'src/string_source.dart';
```

**GOOD:**
```dart
import 'src/error.dart';
import 'src/string_source.dart';

export 'src/error.dart'; // OK
```

**DO** sort sections alphabetically.

**BAD:**
```dart
import 'package:foo/bar.dart'; // OK
import 'package:bar/bar.dart'; // LINT

import 'a/b.dart'; // OK
import 'a.dart'; // LINT
```

**GOOD:**
```dart
import 'package:bar/bar.dart'; // OK
import 'package:foo/bar.dart'; // OK

import 'a.dart'; // OK
import 'a/b.dart'; // OK
```
