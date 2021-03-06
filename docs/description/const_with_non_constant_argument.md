#### Description

The analyzer produces this diagnostic when a const constructor is invoked
with an argument that isn't a constant expression.

#### Example

The following code produces this diagnostic because `i` isn't a constant:

```dart
class C {
  final int i;
  const C(this.i);
}
C f(int i) => const C([!i!]);
```

#### Common fixes

Either make all of the arguments constant expressions, or remove the
`const` keyword to use the non-constant form of the constructor:

```dart
class C {
  final int i;
  const C(this.i);
}
C f(int i) => C(i);
```