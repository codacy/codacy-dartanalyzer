**DO** avoid calls to <Type>.toString() in production code, since it does not
contractually return the user-defined name of the Type (or underlying class).
Development-mode compilers where code size is not a concern use the full name,
but release-mode compilers often choose to minify these symbols.

**BAD:**
```dart
void bar(Object other) {
  if (other.runtimeType.toString() == 'Bar') {
    doThing();
  }
}

Object baz(Thing myThing) {
  return getThingFromDatabase(key: myThing.runtimeType.toString());
}
```

**GOOD:**
```dart
void bar(Object other) {
  if (other is Bar) {
    doThing();
  }
}

class Thing {
  String get thingTypeKey => ...
}

Object baz(Thing myThing) {
  return getThingFromDatabase(key: myThing.thingTypeKey);
}
```

