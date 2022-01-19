#### Description

The analyzer produces this diagnostic when an identifier that isn't a type
is used as a type argument.

#### Example

The following code produces this diagnostic because `x` is a variable, not
a type:

```dart
var x = 0;
List<[!x!]> xList = [];
```

#### Common fixes

Change the type argument to be a type:

```dart
var x = 0;
List<int> xList = [];
```