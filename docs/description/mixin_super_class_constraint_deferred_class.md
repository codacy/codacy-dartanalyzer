#### Description

The analyzer produces this diagnostic when a superclass constraint of a
mixin is imported from a deferred library.

#### Example

The following code produces this diagnostic because the superclass
constraint of `math.Random` is imported from a deferred library:

```dart
import 'dart:async' deferred as async;

mixin M<T> on [!async.Stream<T>!] {}
```

#### Common fixes

If the import doesn't need to be deferred, then remove the `deferred`
keyword:

```dart
import 'dart:async' as async;

mixin M<T> on async.Stream<T> {}
```

If the import does need to be deferred, then remove the superclass
constraint:

```dart
mixin M<T> {}
```