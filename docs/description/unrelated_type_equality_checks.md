**DON'T** Compare references of unrelated types for equality.

Comparing references of a type where neither is a subtype of the other most
likely will return `false` and might not reflect programmer's intent.

`Int64` and `Int32` from `package:fixnum` allow comparing to `int` provided
the `int` is on the right hand side. The lint allows this as a special case. 

**BAD:**
```dart
void someFunction() {
  var x = '1';
  if (x == 1) print('someFunction'); // LINT
}
```

**BAD:**
```dart
void someFunction1() {
  String x = '1';
  if (x == 1) print('someFunction1'); // LINT
}
```

**BAD:**
```dart
void someFunction13(DerivedClass2 instance) {
  var other = DerivedClass3();

  if (other == instance) print('someFunction13'); // LINT
}

class ClassBase {}

class DerivedClass1 extends ClassBase {}

abstract class Mixin {}

class DerivedClass2 extends ClassBase with Mixin {}

class DerivedClass3 extends ClassBase implements Mixin {}
```

**GOOD:**
```dart
void someFunction2() {
  var x = '1';
  var y = '2';
  if (x == y) print(someFunction2); // OK
}
```

**GOOD:**
```dart
void someFunction3() {
  for (var i = 0; i < 10; i++) {
    if (i == 0) print(someFunction3); // OK
  }
}
```

**GOOD:**
```dart
void someFunction4() {
  var x = '1';
  if (x == null) print(someFunction4); // OK
}
```

**GOOD:**
```dart
void someFunction7() {
  List someList;

  if (someList.length == 0) print('someFunction7'); // OK
}
```

**GOOD:**
```dart
void someFunction8(ClassBase instance) {
  DerivedClass1 other;

  if (other == instance) print('someFunction8'); // OK
}
```

**GOOD:**
```dart
void someFunction10(unknown) {
  var what = unknown - 1;
  for (var index = 0; index < unknown; index++) {
    if (what == index) print('someFunction10'); // OK
  }
}
```

**GOOD:**
```dart
void someFunction11(Mixin instance) {
  var other = DerivedClass2();

  if (other == instance) print('someFunction11'); // OK
  if (other != instance) print('!someFunction11'); // OK
}

class ClassBase {}

abstract class Mixin {}

class DerivedClass2 extends ClassBase with Mixin {}
```

