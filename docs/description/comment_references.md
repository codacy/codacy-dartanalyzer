**DO** reference only in scope identifiers in doc comments.

If you surround things like variable, method, or type names in square brackets,
then [`dart doc`](https://dart.dev/tools/dart-doc) will look
up the name and link to its docs.  For this all to work, ensure that all
identifiers in docs wrapped in brackets are in scope.

For example,

**GOOD:**
```dart
/// Return the larger of [a] or [b].
int max_int(int a, int b) { ... }
```

On the other hand, assuming `outOfScopeId` is out of scope:

**BAD:**
```dart
/// Return true if [value] is larger than [outOfScopeId].
bool isOutOfRange(int value) { ... }
```

Note that the square bracket comment format is designed to allow 
comments to refer to declarations using a fairly natural format 
but does not allow *arbitrary expressions*.  In particular, code 
references within square brackets can consist of either

- a single identifier where the identifier is any identifier in scope for the comment (see the spec for what is in scope in doc comments),
- two identifiers separated by a period where the first identifier is the name of a class that is in scope and the second is the name of a member declared in the class,
- a single identifier followed by a pair of parentheses where the identifier is the name of a class that is in scope (used to refer to the unnamed constructor for the class), or
- two identifiers separated by a period and followed by a pair of parentheses where the first identifier is the name of a class that is in scope and the second is the name of a named constructor (not strictly necessary, but allowed for consistency).

