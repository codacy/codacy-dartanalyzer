**DON'T** invoke certain collection method with an argument with an unrelated
type.

Doing this will invoke `==` on the collection's elements and most likely will
return `false`.

An argument passed to a collection method should relate to the collection type
as follows:

* an argument to `Iterable<E>.contains` should be related to `E`
* an argument to `List<E>.remove` should be related to `E`
* an argument to `Map<K, V>.containsKey` should be related to `K`
* an argument to `Map<K, V>.containsValue` should be related to `V`
* an argument to `Map<K, V>.remove` should be related to `K`
* an argument to `Map<K, V>.[]` should be related to `K`
* an argument to `Queue<E>.remove` should be related to `E`
* an argument to `Set<E>.containsAll` should be related to `Iterable<E>`
* an argument to `Set<E>.difference` should be related to `Set<E>`
* an argument to `Set<E>.intersection` should be related to `Set<E>`
* an argument to `Set<E>.lookup` should be related to `E`
* an argument to `Set<E>.remove` should be related to `E`
* an argument to `Set<E>.removeAll` should be related to `Iterable<E>`
* an argument to `Set<E>.retainAll` should be related to `Iterable<E>`

**BAD:**
```dart
void someFunction() {
  var list = <int>[];
  if (list.contains('1')) print('someFunction'); // LINT
}
```

**BAD:**
```dart
void someFunction() {
  var set = <int>{};
  set.removeAll({'1'}); // LINT
}
```

**GOOD:**
```dart
void someFunction() {
  var list = <int>[];
  if (list.contains(1)) print('someFunction'); // OK
}
```

**GOOD:**
```dart
void someFunction() {
  var set = <int>{};
  set.removeAll({1}); // OK
}
```

