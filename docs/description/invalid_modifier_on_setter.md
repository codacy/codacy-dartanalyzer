#### Description

The analyzer produces this diagnostic when the body of a setter is prefixed
by one of the following modifiers: `async`, `async*`, or `sync*`. Setter
bodies must be synchronous.

#### Example

The following code produces this diagnostic because the body of the setter
`x` is marked as being `async`:

```dart
class C {
  set x(int i) [!async!] {}
}
```

#### Common fixes

If the setter can be synchronous, then remove the modifier:

```dart
class C {
  set x(int i) {}
}
```

If the setter can't be synchronous, then use a method to set the value
instead:

```dart
class C {
  void x(int i) async {}
}
```