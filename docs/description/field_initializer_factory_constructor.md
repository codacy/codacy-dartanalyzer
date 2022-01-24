#### Description

The analyzer produces this diagnostic when a factory constructor has a
field formal parameter. Factory constructors can't assign values to fields
because no instance is created; hence, there is no field to assign.

#### Example

The following code produces this diagnostic because the factory constructor
uses a field formal parameter:

```dart
class C {
  int? f;

  factory C([!this.f!]) => throw 0;
}
```

#### Common fixes

Replace the field formal parameter with a normal parameter:

```dart
class C {
  int? f;

  factory C(int f) => throw 0;
}
```