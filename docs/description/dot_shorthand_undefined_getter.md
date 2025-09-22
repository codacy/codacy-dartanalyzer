#### Description

The analyzer produces this diagnostic when a dot shorthand is used to
reference a member, but that member doesn't exist.

#### Example

The following code produces this diagnostic because the enum `E` doesn't
define a static member named `c`:

```dart
void f() {
  E e = .[!c!];
  print(e);
}

enum E {a, b}
```

#### Common fixes

If the name is correct, then define a member with that name in the context
type, which in this case is the enum `E`:

```dart
void f() {
  E e = .c;
  print(e);
}

enum E {a, b, c}
```

If the name is not correct, then replace the name with the name of an
existing member from the context type, which in this case is the enum `E`:

```dart
void f() {
  E e = .b;
  print(e);
}

enum E {a, b}
```