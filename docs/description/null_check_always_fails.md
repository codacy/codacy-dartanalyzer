#### Description

The analyzer produces this diagnostic when the null check operator (`!`)
is used on an expression whose value can only be `null`. In such a case
the operator always throws an exception, which likely isn't the intended
behavior.

#### Example

The following code produces this diagnostic because the function `g` will
always return `null`, which means that the null check in `f` will always
throw:

```dart
void f() {
  [!g()!!];
}

Null g() => null;
```

#### Common fixes

If you intend to always throw an exception, then replace the null check
with an explicit `throw` expression to make the intent more clear:

```dart
void f() {
  g();
  throw TypeError();
}

Null g() => null;
```