#### Description

The analyzer produces this diagnostic when a `switch` statement for an enum
doesn't include an option for one of the values in the enum.

Note that `null` is always a possible value for an enum and therefore also
must be handled.

#### Example

The following code produces this diagnostic because the enum constant `e2`
isn't handled:

```dart
%language=2.19
enum E { e1, e2 }

void f(E e) {
  [!switch (e)!] {
    case E.e1:
      break;
  }
}
```

#### Common fixes

If there's special handling for the missing values, then add a `case`
clause for each of the missing values:

```dart
enum E { e1, e2 }

void f(E e) {
  switch (e) {
    case E.e1:
      break;
    case E.e2:
      break;
  }
}
```

If the missing values should be handled the same way, then add a `default`
clause:

```dart
enum E { e1, e2 }

void f(E e) {
  switch (e) {
    case E.e1:
      break;
    default:
      break;
  }
}
```
TODO(brianwilkerson): This documentation will need to be updated when NNBD
 ships.