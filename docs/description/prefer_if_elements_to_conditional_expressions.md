When building collections, it is preferable to use `if` elements rather than
conditionals.

**BAD:**
```dart
Widget build(BuildContext context) {
  return Row(
    children: [
      IconButton(icon: Icon(Icons.menu)),
      Expanded(child: title),
      isAndroid ? IconButton(icon: Icon(Icons.search)) : null,
    ].where((child) => child != null).toList(),
  );
}
```

**GOOD:**
```dart
Widget build(BuildContext context) {
  return Row(
    children: [
      IconButton(icon: Icon(Icons.menu)),
      Expanded(child: title),
      if (isAndroid) IconButton(icon: Icon(Icons.search)),
    ]
  );
}
```
