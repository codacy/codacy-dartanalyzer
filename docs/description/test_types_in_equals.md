**DO** test type arguments in operator ==(Object other).

Not testing types might result in null pointer exceptions which will be
unexpected for consumers of your class.

**GOOD:**
```dart
class Field {
}

class Good {
  final Field someField;

  Good(this.someField);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is Good &&
        this.someField == other.someField;
  }

  @override
  int get hashCode {
    return someField.hashCode;
  }
}
```

**BAD:**
```dart
class Field {
}

class Bad {
  final Field someField;

  Bad(this.someField);

  @override
  bool operator ==(Object other) {
    Bad otherBad = other as Bad; // LINT
    bool areEqual = otherBad != null && otherBad.someField == someField;
    return areEqual;
  }

  @override
  int get hashCode {
    return someField.hashCode;
  }
}
```

