#### Description

The analyzer produces this diagnostic when a setter is found that doesn't
declare exactly one required positional parameter.

#### Examples

The following code produces this diagnostic because the setter `s` declares
two required parameters:

```dart
%language=2.9
class C {
  set [!s!](int x, int y) {}
}
```

The following code produces this diagnostic because the setter `s` declares
one optional parameter:

```dart
%language=2.9
class C {
  set [!s!]([int x]) {}
}
```

#### Common fixes

Change the declaration so that there's exactly one required positional
parameter:

```dart
%language=2.9
class C {
  set s(int x) {}
}
```