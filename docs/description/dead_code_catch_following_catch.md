#### Description

The analyzer produces this diagnostic when a `catch` clause is found that
can't be executed because it's after a `catch` clause of the form
`catch (e)` or `on Object catch (e)`. The first `catch` clause that matches
the thrown object is selected, and both of those forms will match any
object, so no `catch` clauses that follow them will be selected.

#### Example

The following code produces this diagnostic:

```dart
void f() {
  try {
  } catch (e) {
  } [!on String {
  }!]
}
```

#### Common fixes

If the clause should be selectable, then move the clause before the general
clause:

```dart
void f() {
  try {
  } on String {
  } catch (e) {
  }
}
```

If the clause doesn't need to be selectable, then remove it:

```dart
void f() {
  try {
  } catch (e) {
  }
}
```