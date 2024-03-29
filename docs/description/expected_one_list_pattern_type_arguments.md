#### Description

The analyzer produces this diagnostic when a list pattern has more than
one type argument. List patterns can have either zero type arguments or
one type argument, but can't have more than one.

#### Example

The following code produces this diagnostic because the list pattern
(`[0]`) has two type arguments:

```dart
void f(Object x) {
  if (x case [!<int, int>!][0]) {}
}
```

#### Common fixes

Remove all but one of the type arguments:

```dart
void f(Object x) {
  if (x case <int>[0]) {}
}
```