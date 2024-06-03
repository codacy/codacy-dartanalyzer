#### Description

The analyzer produces this diagnostic when the expression of a spread
operator in a constant map evaluates to something other than a map.

#### Example

The following code produces this diagnostic because the value of `map1` is
`null`, which isn't a map:

```dart
const dynamic map1 = 42;
const Map<String, int> map2 = {...[!map1!]};
```

#### Common fixes

Change the expression to something that evaluates to a constant map:

```dart
const dynamic map1 = {'answer': 42};
const Map<String, int> map2 = {...map1};
```