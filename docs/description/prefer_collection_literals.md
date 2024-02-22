**DO** use collection literals when possible.

**BAD:**
```dart
var points = List();
var addresses = Map<String, String>();
var uniqueNames = Set<String>();
var ids = LinkedHashSet<int>();
var coordinates = LinkedHashMap<int, int>();
```

**GOOD:**
```dart
var points = [];
var addresses = <String, String>{};
var uniqueNames = <String>{};
var ids = <int>{};
var coordinates = <int, int>{};
```

**EXCEPTIONS:**

There are cases with `LinkedHashSet` or `LinkedHashMap` where a literal constructor
will trigger a type error so those will be excluded from the lint.

```dart
void main() {
  LinkedHashSet<int> linkedHashSet =  LinkedHashSet.from([1, 2, 3]); // OK
  LinkedHashMap linkedHashMap = LinkedHashMap(); // OK
  
  printSet(LinkedHashSet<int>()); // LINT
  printHashSet(LinkedHashSet<int>()); // OK

  printMap(LinkedHashMap<int, int>()); // LINT
  printHashMap(LinkedHashMap<int, int>()); // OK
}

void printSet(Set<int> ids) => print('$ids!');
void printHashSet(LinkedHashSet<int> ids) => printSet(ids);
void printMap(Map map) => print('$map!');
void printHashMap(LinkedHashMap map) => printMap(map);
```
