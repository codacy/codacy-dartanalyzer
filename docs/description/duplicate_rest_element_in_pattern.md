#### Description

The analyzer produces this diagnostic when there's more than one rest
pattern in either a list or map pattern. A rest pattern will capture any
values unmatched by other subpatterns, making subsequent rest patterns
unnecessary because there's nothing left to capture.

#### Example

The following code produces this diagnostic because there are two rest
patterns in the list pattern:

```dart
void f(List<int> x) {
  if (x case [0, ..., [!...!]]) {}
}
```

#### Common fixes

Remove all but one of the rest patterns:

```dart
void f(List<int> x) {
  if (x case [0, ...]) {}
}
```