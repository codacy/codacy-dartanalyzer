**DO** Use the cascading style when successively invoking methods on the same
reference.

**BAD:**
```dart
SomeClass someReference = SomeClass();
someReference.firstMethod();
someReference.secondMethod();
```

**BAD:**
```dart
SomeClass someReference = SomeClass();
...
someReference.firstMethod();
someReference.aProperty = value;
someReference.secondMethod();
```

**GOOD:**
```dart
SomeClass someReference = SomeClass()
    ..firstMethod()
    ..aProperty = value
    ..secondMethod();
```

**GOOD:**
```dart
SomeClass someReference = SomeClass();
...
someReference
    ..firstMethod()
    ..aProperty = value
    ..secondMethod();
```

