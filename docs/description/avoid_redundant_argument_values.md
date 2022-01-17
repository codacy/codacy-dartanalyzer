Avoid redundant argument values.

**DON'T** declare arguments with values that match the defaults for the
corresponding parameter.

**BAD:**
```dart
void f({bool valWithDefault = true, bool? val}) {
  ...
}

void main() {
  f(valWithDefault: true);
}
```

**GOOD:**
```dart
void f({bool valWithDefault = true, bool? val}) {
  ...
}

void main() {
  f(valWithDefault: false);
  f();
}
```
