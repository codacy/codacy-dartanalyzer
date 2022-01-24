#### Description

The analyzer produces this diagnostic when a constructor that redirects to
another constructor also attempts to invoke a constructor from the
superclass. The superclass constructor will be invoked when the constructor
that the redirecting constructor is redirected to is invoked.

#### Example

The following code produces this diagnostic because the constructor `C.a`
both redirects to `C.b` and invokes a constructor from the superclass:

```dart
class C {
  C.a() : this.b(), [!super()!];
  C.b();
}
```

#### Common fixes

Remove the invocation of the `super` constructor:

```dart
class C {
  C.a() : this.b();
  C.b();
}
```