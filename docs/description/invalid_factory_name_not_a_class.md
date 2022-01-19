#### Description

The analyzer produces this diagnostic when the name of a factory
constructor isn't the same as the name of the surrounding class.

#### Example

The following code produces this diagnostic because the name of the factory
constructor (`A`) isn't the same as the surrounding class (`C`):

```dart
class A {}

class C {
  factory [!A!]() => throw 0;
}
```

#### Common fixes

If the factory returns an instance of the surrounding class, then rename
the factory:

```dart
class A {}

class C {
  factory C() => throw 0;
}
```

If the factory returns an instance of a different class, then move the
factory to that class:

```dart
class A {
  factory A() => throw 0;
}

class C {}
```

If the factory returns an instance of a different class, but you can't
modify that class or don't want to move the factory, then convert it to be
a static method:

```dart
class A {}

class C {
  static A a() => throw 0;
}
```