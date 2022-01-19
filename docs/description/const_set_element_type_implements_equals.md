#### Description

The analyzer produces this diagnostic when the class of object used as an
element in a constant set literal implements the `==` operator. The
implementation of constant sets uses the `==` operator, so any
implementation other than the one inherited from `Object` requires
executing arbitrary code at compile time, which isn't supported.

#### Example

The following code produces this diagnostic because the constant set
contains an element whose type is `C`, and the class `C` overrides the
implementation of `==`:

```dart
class C {
  const C();

  bool operator ==(Object other) => true;
}

const set = {[!C()!]};
```

#### Common fixes

If you can remove the implementation of `==` from the class, then do so:

```dart
class C {
  const C();
}

const set = {C()};
```

If you can't remove the implementation of `==` from the class, then make
the set be non-constant:

```dart
class C {
  const C();

  bool operator ==(Object other) => true;
}

final set = {C()};
```