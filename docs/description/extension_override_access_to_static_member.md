#### Description

The analyzer produces this diagnostic when an extension override is the
receiver of the invocation of a static member. Similar to static members in
classes, the static members of an extension should be accessed using the
name of the extension, not an extension override.

#### Example

The following code produces this diagnostic because `m` is static:

```dart
extension E on String {
  static void m() {}
}

void f() {
  E('').[!m!]();
}
```

#### Common fixes

Replace the extension override with the name of the extension:

```dart
extension E on String {
  static void m() {}
}

void f() {
  E.m();
}
```