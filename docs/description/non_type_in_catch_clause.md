#### Description

The analyzer produces this diagnostic when the identifier following the
`on` in a `catch` clause is defined to be something other than a type.

#### Example

The following code produces this diagnostic because `f` is a function, not
a type:

```dart
%language=2.9
void f() {
  try {
    // ...
  } on [!f!] {
    // ...
  }
}
```

#### Common fixes

Change the name to the type of object that should be caught:

```dart
%language=2.9
void f() {
  try {
    // ...
  } on FormatException {
    // ...
  }
}
```