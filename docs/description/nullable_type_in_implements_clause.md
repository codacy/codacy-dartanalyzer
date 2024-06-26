#### Description

The analyzer produces this diagnostic when a class, mixin, or
extension type declaration has an `implements` clause, and an
interface is followed by a `?`.

It isn't valid to specify a nullable interface because doing so would have
no meaning; it wouldn't change the interface being inherited by the class
containing the `implements` clause.

Note, however, that it _is_ valid to use a nullable type as a type argument
to the interface, such as `class A implements B<C?> {}`.


#### Example

The following code produces this diagnostic because `A?` is a nullable
type, and nullable types can't be used in an `implements` clause:

```dart
class A {}
class B implements [!A?!] {}
```

#### Common fixes

Remove the question mark from the type:

```dart
class A {}
class B implements A {}
```