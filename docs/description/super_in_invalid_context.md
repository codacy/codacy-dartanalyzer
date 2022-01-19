#### Description

The analyzer produces this diagnostic when the keyword `super` is used
outside of a instance method.

#### Example

The following code produces this diagnostic because `super` is used in a
top-level function:

```dart
void f() {
  [!super!].f();
}
```

#### Common fixes

Rewrite the code to not use `super`.