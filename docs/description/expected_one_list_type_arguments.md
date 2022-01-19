#### Description

The analyzer produces this diagnostic when a list literal has more than one
type argument.

#### Example

The following code produces this diagnostic because the list literal has
two type arguments when it can have at most one:

```dart
var l = [!<int, int>!][];
```

#### Common fixes

Remove all except one of the type arguments:

```dart
var l = <int>[];
```