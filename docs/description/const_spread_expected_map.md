#### Description

The analyzer produces this diagnostic when the expression of a spread
operator in a constant map evaluates to something other than a map.

#### Example

The following code produces this diagnostic because the value of `map1` is
`null`, which isn't a map:

```dart
%language=2.9
const Map<String, int> map1 = null;
const Map<String, int> map2 = {...[!map1!]};
```

#### Common fixes

Change the expression to something that evaluates to a constant map:

```dart
%language=2.9
const Map<String, int> map1 = {};
const Map<String, int> map2 = {...map1};
```