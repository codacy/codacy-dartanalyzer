Add a trailing whitespace to prevent missing whitespace between adjacent
strings.

With long text split across adjacent strings it's easy to forget a whitespace
between strings.

**BAD:**
```dart
var s =
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed'
  'do eiusmod tempor incididunt ut labore et dolore magna';
```

**GOOD:**
```dart
var s =
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed '
  'do eiusmod tempor incididunt ut labore et dolore magna';
```

