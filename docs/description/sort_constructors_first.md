**DO** sort constructor declarations before other members.

**GOOD:**
```dart
abstract class Animation<T> {
  const Animation(this.value);
  double value;
  void addListener(VoidCallback listener);
}
```

**BAD:**
```dart
abstract class Visitor {
  double value;
  visitSomething(Something s);
  Visitor();
}
```

