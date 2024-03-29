Making asynchronous calls in non-`async` functions is usually the sign of a
programming error.  In general these functions should be marked `async` and such
futures should likely be awaited (as enforced by `unawaited_futures`).

**DON'T** invoke asynchronous functions in non-`async` blocks.

**BAD:**
```dart
void recreateDir(String path) {
  deleteDir(path);
  createDir(path);
}

Future<void> deleteDir(String path) async {}

Future<void> createDir(String path) async {}
```

**GOOD:**
```dart
Future<void> recreateDir(String path) async {
  await deleteDir(path);
  await createDir(path);
}

Future<void> deleteDir(String path) async {}

Future<void> createDir(String path) async {}
```
