#### Description

The analyzer produces this diagnostic when the class of object used as a
key in a constant map literal implements the `==` operator. The
implementation of constant maps uses the `==` operator, so any
implementation other than the one inherited from `Object` requires
executing arbitrary code at compile time, which isn't supported.

#### Example

The following code produces this diagnostic because the constant map
contains a key whose type is `C`, and the class `C` overrides the
implementation of `==`:

```dart
class C {
  const C();

  bool operator ==(Object other) => true;
}

const map = {[!C()!] : 0};
```

#### Common fixes

If you can remove the implementation of `==` from the class, then do so:

```dart
class C {
  const C();
}

const map = {C() : 0};
```

If you can't remove the implementation of `==` from the class, then make
the map be non-constant:

```dart
class C {
  const C();

  bool operator ==(Object other) => true;
}

final map = {C() : 0};
```