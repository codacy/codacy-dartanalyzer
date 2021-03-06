#### Description

The analyzer produces this diagnostic when the expression of a spread
operator in a constant list or set evaluates to something other than a list
or a set.

#### Example

The following code produces this diagnostic because the value of `list1` is
`null`, which is neither a list nor a set:

```dart
%language=2.9
const List<int> list1 = null;
const List<int> list2 = [...[!list1!]];
```

#### Common fixes

Change the expression to something that evaluates to either a constant list
or a constant set:

```dart
%language=2.9
const List<int> list1 = [];
const List<int> list2 = [...list1];
```