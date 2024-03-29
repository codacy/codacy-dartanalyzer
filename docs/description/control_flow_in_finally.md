**AVOID** control flow leaving finally blocks.

Using control flow in finally blocks will inevitably cause unexpected behavior
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
class BadReturn {
  double nonCompliantMethod() {
    try {
      return 1 / 0;
    } catch (e) {
      print(e);
    } finally {
      return 1.0; // LINT
    }
  }
}
```

**BAD:**
```dart
class BadContinue {
  double nonCompliantMethod() {
    for (var o in [1, 2]) {
      try {
        print(o / 0);
      } catch (e) {
        print(e);
      } finally {
        continue; // LINT
      }
    }
    return 1.0;
  }
}
```

**BAD:**
```dart
class BadBreak {
  double nonCompliantMethod() {
    for (var o in [1, 2]) {
      try {
        print(o / 0);
      } catch (e) {
        print(e);
      } finally {
        break; // LINT
      }
    }
    return 1.0;
  }
}
```

