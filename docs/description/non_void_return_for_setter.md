#### Description

The analyzer produces this diagnostic when a setter is defined with a
return type other than `void`.

#### Example

The following code produces this diagnostic because the setter `p` has a
return type of `int`:

```dart
class C {
  [!int!] set p(int i) => 0;
}
```

#### Common fixes

Change the return type to `void` or omit the return type:

```dart
class C {
  set p(int i) => 0;
}
```