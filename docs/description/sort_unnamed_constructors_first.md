
**DO** sort unnamed constructor declarations first, before named ones.

**GOOD:**
```dart
abstract class CancelableFuture<T> implements Future<T>  {
  factory CancelableFuture(computation()) => ...
  factory CancelableFuture.delayed(Duration duration, [computation()]) => ...
  ...
}
```

**BAD:**
```dart
class _PriorityItem {
  factory _PriorityItem.forName(bool isStatic, String name, _MemberKind kind) => ...
  _PriorityItem(this.isStatic, this.kind, this.isPrivate);
  ...
}
```

