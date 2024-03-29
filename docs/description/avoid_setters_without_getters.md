**DON'T** define a setter without a corresponding getter.

Defining a setter without defining a corresponding getter can lead to logical
inconsistencies.  Doing this could allow you to set a property to some value,
but then upon observing the property's value, it could easily be different.

**BAD:**
```dart
class Bad {
  int l, r;

  set length(int newLength) {
    r = l + newLength;
  }
}
```

**GOOD:**
```dart
class Good {
  int l, r;

  int get length => r - l;

  set length(int newLength) {
    r = l + newLength;
  }
}
```

