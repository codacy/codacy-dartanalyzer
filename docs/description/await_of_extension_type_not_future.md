#### Description

The analyzer produces this diagnostic when the type of the expression in
an `await` expression is an extension type, and the extension type isn't a
subclass of `Future`.

#### Example

The following code produces this diagnostic because the extension type `E`
isn't a subclass of `Future`:

```dart
extension type E(int i) {}

void f(E e) async {
  [!await!] e;
}
```

#### Common fixes

If the extension type is correctly defined, then remove the `await`:

```dart
extension type E(int i) {}

void f(E e) {
  e;
}
```

If the extension type is intended to be awaitable, then add `Future` (or a
subtype of `Future`) to the `implements` clause (adding an `implements`
clause if there isn't one already), and make the representation type
match:

```dart
extension type E(Future<int> i) implements Future<int> {}

void f(E e) async {
  await e;
}
```