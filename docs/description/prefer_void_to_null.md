**DON'T** use the type Null where void would work.

**BAD:**
```dart
Null f() {}
Future<Null> f() {}
Stream<Null> f() {}
f(Null x) {}
```

**GOOD:**
```dart
void f() {}
Future<void> f() {}
Stream<void> f() {}
f(void x) {}
```

Some exceptions include formulating special function types:

```dart
Null Function(Null, Null);
```

and for making empty literals which are safe to pass into read-only locations
for any type of map or list:

```dart
<Null>[];
<int, Null>{};
```
