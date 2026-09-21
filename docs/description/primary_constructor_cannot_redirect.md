#### Description

The analyzer produces this diagnostic when a primary constructor redirects
to another constructor.

#### Example

The following code produces this diagnostic because the primary
constructor has a redirect to the constructor `C.named`:

```dart
class C(int x) {
  C.named() : this(0);
  this : assert(x > 0), [!this!].named();
}
```

#### Common fixes

If the redirection isn't necessary, then remove it:

```dart
class C(int x) {
  new named() : this(0);
  this : assert(x > 0);
}
```

If the redirection is necessary, then convert the primary constructor into
an in-body constructor, and rework other constructors as necessary:

```dart
class C {
  new named();
  new(int x) : this.named();
}
```