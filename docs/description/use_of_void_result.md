#### Description

The analyzer produces this diagnostic when it finds an expression whose
type is `void`, and the expression is used in a place where a value is
expected, such as before a member access or on the right-hand side of an
assignment.

#### Example

The following code produces this diagnostic because `f` doesn't produce an
object on which `toString` can be invoked:

```dart
void f() {}

void g() {
  [!f()!].toString();
}
```

#### Common fixes

Either rewrite the code so that the expression has a value or rewrite the
code so that it doesn't depend on the value.