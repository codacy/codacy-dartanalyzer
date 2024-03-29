**AVOID** defining a class that contains only static members.

Creating classes with the sole purpose of providing utility or otherwise static
methods is discouraged.  Dart allows functions to exist outside of classes for
this very reason.

**BAD:**
```dart
class DateUtils {
  static DateTime mostRecent(List<DateTime> dates) {
    return dates.reduce((a, b) => a.isAfter(b) ? a : b);
  }
}

class _Favorites {
  static const mammal = 'weasel';
}
```

**GOOD:**
```dart
DateTime mostRecent(List<DateTime> dates) {
  return dates.reduce((a, b) => a.isAfter(b) ? a : b);
}

const _favoriteMammal = 'weasel';
```

