From [Effective Dart](https://dart.dev/guides/language/effective-dart/design#prefer-type-annotating-public-fields-and-top-level-variables-if-the-type-isnt-obvious):

**PREFER** type annotating public APIs.

Type annotations are important documentation for how a library should be used.
Annotating the parameter and return types of public methods and functions helps
users understand what the API expects and what it provides.

Note that if a public API accepts a range of values that Dart's type system
cannot express, then it is acceptable to leave that untyped.  In that case, the
implicit `dynamic` is the correct type for the API.

For code internal to a library (either private, or things like nested functions)
annotate where you feel it helps, but don't feel that you *must* provide them.

**BAD:**
```dart
install(id, destination) {
  // ...
}
```

Here, it's unclear what `id` is.  A string? And what is `destination`? A string
or a `File` object? Is this method synchronous or asynchronous?

**GOOD:**
```dart
Future<bool> install(PackageId id, String destination) {
  // ...
}
```

With types, all of this is clarified.

