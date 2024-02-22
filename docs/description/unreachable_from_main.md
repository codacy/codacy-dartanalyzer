Top-level members in an executable library should be used directly inside this
library.  An executable library is a library that contains a `main` top-level
function or that contains a top-level function annotated with
`@pragma('vm:entry-point')`).  Executable libraries are not usually imported
and it's better to avoid defining unused members.

This rule assumes that an executable library isn't imported by other files
except to execute its `main` function.

**BAD:**

```dart
main() {}
void f() {}
```

**GOOD:**

```dart
main() {
  f();
}
void f() {}
```

