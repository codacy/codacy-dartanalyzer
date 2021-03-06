#### Description

The analyzer produces this diagnostic when a constant set literal contains
an element that isn't a compile-time constant.

#### Example

The following code produces this diagnostic because `i` isn't a constant:

```dart
var i = 0;

var s = const {[!i!]};
```

#### Common fixes

If the element can be changed to be a constant, then change it:

```dart
const i = 0;

var s = const {i};
```

If the element can't be a constant, then remove the keyword `const`:

```dart
var i = 0;

var s = {i};
```