#### Description

The analyzer produces this diagnostic when a name that isn't defined is
used as an annotation.

#### Example

The following code produces this diagnostic because the name `undefined`
isn't defined:

```dart
[!@undefined!]
void f() {}
```

#### Common fixes

If the name is correct, but it isn't declared yet, then declare the name as
a constant value:

```dart
const undefined = 'undefined';

@undefined
void f() {}
```

If the name is wrong, replace the name with the name of a valid constant:

```dart
@deprecated
void f() {}
```

Otherwise, remove the annotation.