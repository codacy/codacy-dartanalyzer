**AVOID** wrapping widgets in unnecessary containers.

Wrapping a widget in `Container` with no other parameters set has no effect 
and makes code needlessly more complex.

**BAD:**
```dart
Widget buildRow() {
  return Container(
      child: Row(
        children: <Widget>[
          const MyLogo(),
          const Expanded(
            child: Text('...'),
          ),
        ],
      )
  );
}
```

**GOOD:**
```dart
Widget buildRow() {
  return Row(
    children: <Widget>[
      const MyLogo(),
      const Expanded(
        child: Text('...'),
      ),
    ],
  );
}
```
