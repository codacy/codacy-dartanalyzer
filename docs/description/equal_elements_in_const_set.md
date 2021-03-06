#### Description

The analyzer produces this diagnostic when two elements in a constant set
literal have the same value. The set can only contain each value once,
which means that one of the values is unnecessary.

#### Example

The following code produces this diagnostic because the string `'a'` is
specified twice:

```dart
const Set<String> set = {'a', [!'a'!]};
```

#### Common fixes

Remove one of the duplicate values:

```dart
const Set<String> set = {'a'};
```

Note that literal sets preserve the order of their elements, so the choice
of which element to remove might affect the order in which elements are
returned by an iterator.