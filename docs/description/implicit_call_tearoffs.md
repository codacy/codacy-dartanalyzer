**DO**
Explicitly tear off `.call` methods from objects when assigning to a Function
type. There is less magic with an explicit tear off. Future language versions
may remove the implicit call tear off.

**BAD:**
```dart
class Callable {
  void call() {}
}
void callIt(void Function() f) {
  f();
}

callIt(Callable());
```

**GOOD:**
```dart
class Callable {
  void call() {}
}
void callIt(void Function() f) {
  f();
}

callIt(Callable().call);
```

