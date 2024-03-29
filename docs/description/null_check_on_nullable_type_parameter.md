**DON'T** use null check on a potentially nullable type parameter.

Given a generic type parameter `T` which has a nullable bound (e.g. the default
bound of `Object?`), it is very easy to introduce erroneous null checks when
working with a variable of type `T?`. Specifically, it is not uncommon to have
`T? x;` and want to assert that `x` has been set to a valid value of type `T`.
A common mistake is to do so using `x!`. This is almost always incorrect, since
if `T` is a nullable type, `x` may validly hold `null` as a value of type `T`.

**BAD:**
```dart
T run<T>(T callback()) {
  T? result;
   (() { result = callback(); })();
  return result!;
}
```

**GOOD:**
```dart
T run<T>(T callback()) {
  T? result;
   (() { result = callback(); })();
  return result as T;
}
```

