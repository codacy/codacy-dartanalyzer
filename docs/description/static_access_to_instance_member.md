#### Description

The analyzer produces this diagnostic when a class name is used to access
an instance field. Instance fields don't exist on a class; they exist only
on an instance of the class.

#### Example

The following code produces this diagnostic because `x` is an instance
field:

```dart
class C {
  static int a = 0;

  int b = 0;
}

int f() => C.[!b!];
```

#### Common fixes

If you intend to access a static field, then change the name of the field
to an existing static field:

```dart
class C {
  static int a = 0;

  int b = 0;
}

int f() => C.a;
```

If you intend to access the instance field, then use an instance of the
class to access the field:

```dart
class C {
  static int a = 0;

  int b = 0;
}

int f(C c) => c.b;
```