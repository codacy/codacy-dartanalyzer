#### Description

The analyzer produces this diagnostic when the stack trace parameter in a
`catch` clause isn't referenced within the body of the `catch` block.

#### Example

The following code produces this diagnostic because `stackTrace` isn't
referenced:

```dart
void f() {
  try {
    // ...
  } catch (exception, [!stackTrace!]) {
    // ...
  }
}
```

#### Common fixes

If you need to reference the stack trace parameter, then add a reference to
it. Otherwise, remove it:

```dart
void f() {
  try {
    // ...
  } catch (exception) {
    // ...
  }
}
```