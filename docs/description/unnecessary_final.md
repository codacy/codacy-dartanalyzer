#### Description

The analyzer produces this diagnostic when either a field initializing
parameter or a super parameter in a constructor has the keyword `final`.
In both cases the keyword is unnecessary because the parameter is
implicitly `final`.

#### Examples

The following code produces this diagnostic because the field initializing
parameter has the keyword `final`:

```dart
class A {
  int value;

  A([!final!] this.value);
}
```

The following code produces this diagnostic because the super parameter in
`B` has the keyword `final`:

```dart
class A {
  A(int value);
}

class B extends A {
  B([!final!] super.value);
}
```

#### Common fixes

Remove the unnecessary `final` keyword:

```dart
class A {
  A(int value);
}

class B extends A {
  B(super.value);
}
```