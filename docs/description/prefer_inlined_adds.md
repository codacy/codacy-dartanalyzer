Declare elements in list literals inline, rather than using `add` and 
`addAll` methods where possible.


**BAD:**
```dart
var l = ['a']..add('b')..add('c');
var l2 = ['a']..addAll(['b', 'c']);
```

**GOOD:**
```dart
var l = ['a', 'b', 'c'];
var l2 = ['a', 'b', 'c'];
```
