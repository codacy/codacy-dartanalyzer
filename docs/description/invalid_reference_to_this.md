#### Description

The analyzer produces this diagnostic when `this` is used outside of an
instance method or a generative constructor. The reserved word `this` is
only defined in the context of an instance method or a generative
constructor.

#### Example

The following code produces this diagnostic because `v` is a top-level
variable:

```dart
C f() => [!this!];

class C {}
```

#### Common fixes

Use a variable of the appropriate type in place of `this`, declaring it if
necessary:

```dart
C f(C c) => c;

class C {}
```