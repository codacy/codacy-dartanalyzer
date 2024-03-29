**AVOID** using the following asynchronous file I/O methods because they are
much slower than their synchronous counterparts.

* `Directory.exists`
* `Directory.stat`
* `File.lastModified`
* `File.exists`
* `File.stat`
* `FileSystemEntity.isDirectory`
* `FileSystemEntity.isFile`
* `FileSystemEntity.isLink`
* `FileSystemEntity.type`

**BAD:**
```dart
import 'dart:io';

Future<Null> someFunction() async {
  var file = File('/path/to/my/file');
  var now = DateTime.now();
  if ((await file.lastModified()).isBefore(now)) print('before'); // LINT
}
```

**GOOD:**
```dart
import 'dart:io';

Future<Null> someFunction() async {
  var file = File('/path/to/my/file');
  var now = DateTime.now();
  if (file.lastModifiedSync().isBefore(now)) print('before'); // OK
}
```

