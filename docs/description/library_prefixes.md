**DO** use `lowercase_with_underscores` when specifying a library prefix.

**GOOD:**
```dart
import 'dart:math' as math;
import 'dart:json' as json;
import 'package:js/js.dart' as js;
import 'package:javascript_utils/javascript_utils.dart' as js_utils;
```

**BAD:**
```dart
import 'dart:math' as Math;
import 'dart:json' as JSON;
import 'package:js/js.dart' as JS;
import 'package:javascript_utils/javascript_utils.dart' as jsUtils;
```

