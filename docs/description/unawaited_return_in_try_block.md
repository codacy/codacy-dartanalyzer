#### Description

The analyzer produces this diagnostic when a `Future` is returned from within
a `try` block, in an `async` function, without awaiting the returned `Future`.

#### Example

The following code produces this diagnostic because the `Future` returned
from `futureString` is returned without using `await`. This can lead to
unexpected behavior because exceptions thrown by the `Future` won't be
caught by the `catch` block.

```dart
Future<String> futureString(Future<String> value) async {
  try {
    [!return!] value;
  } catch (e) {
    print(e);
    return 'default';
  }
}
```

#### Common fixes

Add `await` before the returned `Future`:

```dart
Future<String> futureString(Future<String> value) async {
  try {
    return await value;
  } catch (e) {
    print(e);
    return 'default';
  }
}
```