#### Description

The analyzer produces this diagnostic when a function that has a return
type of `void`, `Future<void>`, or `FutureOr<void>` uses an expression
function body (`=>`) and the returned value is a literal set containing a
single element.

Although the language allows it, returning a value from a `void` function
isn't useful because it can't be used at the call site. In this particular
case the return is often due to a misunderstanding about the syntax. The
braces aren't necessary and can be removed.

#### Example

The following code produces this diagnostic because the closure being
passed to `g` has a return type of `void`, but is returning a set:

```dart
void f() {
  g(() => [!{1}!]);
}

void g(void Function() p) {}
```

#### Common fixes

Remove the braces from around the value:

```dart
void f() {
  g(() => 1);
}

void g(void Function() p) {}
```