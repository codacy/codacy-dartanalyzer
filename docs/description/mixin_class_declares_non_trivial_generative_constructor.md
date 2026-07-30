#### Description

The analyzer produces this diagnostic when a mixin class declares a non-trivial
generative constructor. Trivial constructors are allowed, but non-trivial ones
(those with parameters, bodies, or initializers) aren't.

#### Example

The following code produces this diagnostic because the `mixin class` `A`
defines a generative constructor with a body:

```dart
mixin class A {
  [!A!]() {}
}
```

#### Common fixes

If you can remove the body or parameters of the constructor to make it trivial,
then do so:

```dart
mixin class A {
  A(); // Trivial constructor
}
```

If the constructor can't be made trivial, then convert the `mixin class` to a
regular `class` and extend or implement it, or separate the mixin capability:

```dart
class A {
  A() {}
}

mixin class AM { // A separate mixin for mixing in behavior
}
```