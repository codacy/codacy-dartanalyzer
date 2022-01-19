#### Description

The analyzer produces this diagnostic when a type argument isn't the same
as or a subclass of the bounds of the corresponding type parameter.

#### Example

The following code produces this diagnostic because `String` isn't a
subclass of `num`:

```dart
class A<E extends num> {}

var a = A<[!String!]>();
```

#### Common fixes

Change the type argument to be a subclass of the bounds:

```dart
class A<E extends num> {}

var a = A<int>();
```