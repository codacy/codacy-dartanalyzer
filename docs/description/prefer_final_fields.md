**DO** prefer declaring private fields as final if they are not reassigned later
in the library.

Declaring fields as final when possible is a good practice because it helps
avoid accidental reassignments and allows the compiler to do optimizations.

**BAD:**
```dart
class BadImmutable {
  var _label = 'hola mundo! BadImmutable'; // LINT
  var label = 'hola mundo! BadImmutable'; // OK
}
```

**BAD:**
```dart
class MultipleMutable {
  var _label = 'hola mundo! GoodMutable', _offender = 'mumble mumble!'; // LINT
  var _someOther; // LINT

  MultipleMutable() : _someOther = 5;

  MultipleMutable(this._someOther);

  void changeLabel() {
    _label= 'hello world! GoodMutable';
  }
}
```

**GOOD:**
```dart
class GoodImmutable {
  final label = 'hola mundo! BadImmutable', bla = 5; // OK
  final _label = 'hola mundo! BadImmutable', _bla = 5; // OK
}
```

**GOOD:**
```dart
class GoodMutable {
  var _label = 'hola mundo! GoodMutable';

  void changeLabel() {
    _label = 'hello world! GoodMutable';
  }
}
```

**BAD:**
```dart
class AssignedInAllConstructors {
  var _label; // LINT
  AssignedInAllConstructors(this._label);
  AssignedInAllConstructors.withDefault() : _label = 'Hello';
}
```

**GOOD:**
```dart
class NotAssignedInAllConstructors {
  var _label; // OK
  NotAssignedInAllConstructors();
  NotAssignedInAllConstructors.withDefault() : _label = 'Hello';
}
```
