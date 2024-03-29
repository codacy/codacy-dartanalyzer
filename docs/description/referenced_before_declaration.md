#### Description

The analyzer produces this diagnostic when a variable is referenced before
it's declared. In Dart, variables are visible everywhere in the block in
which they are declared, but can only be referenced after they are
declared.

The analyzer also produces a context message that indicates where the
declaration is located.

#### Example

The following code produces this diagnostic because `i` is used before it
is declared:

```dart
%language=2.9
void f() {
  print([!i!]);
  int i = 5;
}
```

#### Common fixes

If you intended to reference the local variable, move the declaration
before the first reference:

```dart
%language=2.9
void f() {
  int i = 5;
  print(i);
}
```

If you intended to reference a name from an outer scope, such as a
parameter, instance field or top-level variable, then rename the local
declaration so that it doesn't hide the outer variable.

```dart
%language=2.9
void f(int i) {
  print(i);
  int x = 5;
  print(x);
}
```