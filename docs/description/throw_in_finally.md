
**AVOID** throwing exceptions in finally blocks.

Throwing exceptions in finally blocks will inevitably cause unexpected behavior
that is hard to debug.

**GOOD:**
```dart
class Ok {
  double compliantMethod() {
    var i = 5;
    try {
      i = 1 / 0;
    } catch (e) {
      print(e); // OK
    }
    return i;
  }
}
```

**BAD:**
```dart
class BadThrow {
  double nonCompliantMethod() {
    try {
      print('hello world! ${1 / 0}');
    } catch (e) {
      print(e);
    } finally {
      throw 'Find the hidden error :P'; // LINT
    }
  }
}
```

