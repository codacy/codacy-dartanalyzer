#### Description

The analyzer produces this diagnostic when a variable that is declared to
be a constant doesn't have an initializer.

#### Example

The following code produces this diagnostic because `c` isn't initialized:

```dart
const [!c!];
```

#### Common fixes

Add an initializer:

```dart
const c = 'c';
```