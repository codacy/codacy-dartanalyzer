#### Description

The analyzer produces this diagnostic when the label in a `continue`
statement resolves to a label on a `switch` statement.

#### Example

The following code produces this diagnostic because the label `l`, used to
label a `switch` statement, is used in the `continue` statement:

```dart
void f(int i) {
  l: switch (i) {
    case 0:
      [!continue l;!]
  }
}
```

#### Common fixes

Find a different way to achieve the control flow you need; for example, by
introducing a loop that re-executes the `switch` statement.