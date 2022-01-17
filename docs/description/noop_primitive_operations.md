
Some operations on primitive types are idempotent and can be removed.

**BAD:**

```dart
doubleValue.toDouble();

intValue.toInt();
intValue.round();
intValue.ceil();
intValue.floor();
intValue.truncate();

string.toString();
string = 'hello\n'
    'world\n'
    ''; // useless empty string
```
