Use spread collections when possible.

Collection literals are excellent when you want to create a new collection out 
of individual items. But, when existing items are already stored in another 
collection, spread collection syntax leads to simpler code.

**BAD:**

```dart
Widget build(BuildContext context) {
  return CupertinoPageScaffold(
    child: ListView(
      children: [
        Tab2Header(),
      ]..addAll(buildTab2Conversation()),
    ),
  );
}
```

```dart
var ints = [1, 2, 3];
print(['a']..addAll(ints.map((i) => i.toString()))..addAll(['c']));
```

```dart
var things;
var l = ['a']..addAll(things ?? const []);
```


**GOOD:**

```dart
Widget build(BuildContext context) {
  return CupertinoPageScaffold(
    child: ListView(
      children: [
        Tab2Header(),
        ...buildTab2Conversation(),
      ],
    ),
  );
}
```

```dart
var ints = [1, 2, 3];
print(['a', ...ints.map((i) => i.toString()), 'c');
```

```dart
var things;
var l = ['a', ...?things];
```
