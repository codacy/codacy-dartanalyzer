#### Description

The analyzer produces this diagnostic when a method or function is invoked
with a different number of type arguments than the number of type
parameters specified in its declaration. There must either be no type
arguments or the number of arguments must match the number of parameters.

#### Example

The following code produces this diagnostic because the invocation of the
method `m` has two type arguments, but the declaration of `m` only has one
type parameter:

```dart
class C {
  int m<A>(A a) => 0;
}

int f(C c) => c.m[!<int, int>!](2);
```

#### Common fixes

If the type arguments are necessary, then make them match the number of
type parameters by either adding or removing type arguments:

```dart
class C {
  int m<A>(A a) => 0;
}

int f(C c) => c.m<int>(2);
```

If the type arguments aren't necessary, then remove them:

```dart
class C {
  int m<A>(A a) => 0;
}

int f(C c) => c.m(2);
```