#### Description

The analyzer produces this diagnostic when a pattern variable is assigned
a value inside a guard (`when`) clause.

#### Example

The following code produces this diagnostic because the variable `a` is
assigned a value inside the guard clause:

```dart
void f(int x) {
  if (x case var a when ([!a!] = 1) > 0) {
    print(a);
  }
}
```

#### Common fixes

If there's a value you need to capture, then assign it to a different
variable:

```dart
void f(int x) {
  var b;
  if (x case var a when (b = 1) > 0) {
    print(a + b);
  }
}
```

If there isn't a value you need to capture, then remove the assignment:

```dart
void f(int x) {
  if (x case var a when 1 > 0) {
    print(a);
  }
}
```