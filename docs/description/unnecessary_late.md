**DO** not specify the `late` modifier for top-level and static variables
when the declaration contains an initializer. 

Top-level and static variables with initializers are already evaluated lazily
as if they are marked `late`.

**BAD:**
```dart
late String badTopLevel = '';
```

**GOOD:**
```dart
String goodTopLevel = '';
```

**BAD:**
```dart
class BadExample {
  static late String badStatic = '';
}
```

**GOOD:**
```dart
class GoodExample {
  late String goodStatic;
}
```
