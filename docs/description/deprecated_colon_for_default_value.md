#### Description

The analyzer produces this diagnostic when a colon is used as the
separator before the default value of an optional parameter. While this
syntax is allowed, it's being deprecated in favor of using an equal sign.

#### Example

The following code produces this diagnostic because a colon is being used
before the default value of the optional parameter `i`:

```dart
void f({int i [!:!] 0}) {}
```

#### Common fixes

Replace the colon with an equal sign.

```dart
void f({int i = 0}) {}
```