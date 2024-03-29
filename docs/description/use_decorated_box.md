**DO** use `DecoratedBox` when `Container` has only a `Decoration`.

A `Container` is a heavier Widget than a `DecoratedBox`, and as bonus,
`DecoratedBox` has a `const` constructor.

**BAD:**
```dart
Widget buildArea() {
  return Container(
    decoration: const BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.all(
        Radius.circular(5),
      ),
    ),
    child: const Text('...'),
  );
}
```

**GOOD:**
```dart
Widget buildArea() {
  return const DecoratedBox(
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.all(
        Radius.circular(5),
      ),
    ),
    child: Text('...'),
  );
}
```
