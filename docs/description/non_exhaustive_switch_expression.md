#### Description

The analyzer produces this diagnostic when a `switch` expression is
missing a case for one or more of the possible values that could flow
through it.

#### Example

The following code produces this diagnostic because the switch expression
doesn't have a case for the value `E.three`:

```dart
enum E { one, two, three }

String f(E e) => [!switch!] (e) {
    E.one => 'one',
    E.two => 'two',
  };
```

#### Common fixes

If the missing values are distinctly meaningful to the switch expression,
then add a case for each of the values missing a match:

```dart
enum E { one, two, three }

String f(E e) => switch (e) {
    E.one => 'one',
    E.two => 'two',
    E.three => 'three',
  };
```

If the missing values don't need to be matched, then add a wildcard
pattern that returns a simple default:

```dart
enum E { one, two, three }

String f(E e) => switch (e) {
    E.one => 'one',
    E.two => 'two',
    _ => 'unknown',
  };
```

Be aware that a wildcard pattern will handle any values added to the type
in the future. You will lose the ability to have the compiler warn you if
the `switch` needs to be updated to account for newly added types.