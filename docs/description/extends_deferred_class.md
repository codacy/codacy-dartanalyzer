#### Description

The analyzer produces this diagnostic when a type (class or mixin) is a
subtype of a class from a library being imported using a deferred import.
The supertypes of a type must be compiled at the same time as the type, and
classes from deferred libraries aren't compiled until the library is
loaded.

For more information, see the language tour's coverage of
[deferred loading](https://dart.dev/guides/language/language-tour#lazily-loading-a-library).

#### Example

Given a file (`a.dart`) that defines the class `A`:

```dart
%uri="lib/a.dart"
class A {}
```

The following code produces this diagnostic because the superclass of `B`
is declared in a deferred library:

```dart
import 'a.dart' deferred as a;

class B extends [!a.A!] {}
```

#### Common fixes

If you need to create a subtype of a type from the deferred library, then
remove the `deferred` keyword:

```dart
import 'a.dart' as a;

class B extends a.A {}
```