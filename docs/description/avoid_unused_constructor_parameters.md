
**AVOID** defining unused parameters in constructors.

**BAD:**
```dart
class BadOne {
  BadOne(int unusedParameter, [String unusedPositional]);
}

class BadTwo {
  int c;

  BadTwo(int a, int b, int x) {
    c = a + b;
  }
}
```

