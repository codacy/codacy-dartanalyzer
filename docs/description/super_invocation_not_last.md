#### Description

The analyzer produces this diagnostic when the initializer list of a
constructor contains an invocation of a constructor in the superclass, but
the invocation isn't the last item in the initializer list.

#### Example

The following code produces this diagnostic because the invocation of the
superclass' constructor isn't the last item in the initializer list:

```dart
class A {
  A(int x);
}

class B extends A {
  B(int x) : [!super!](x), assert(x >= 0);
}
```

#### Common fixes

Move the invocation of the superclass' constructor to the end of the
initializer list:

```dart
class A {
  A(int x);
}

class B extends A {
  B(int x) : assert(x >= 0), super(x);
}
```