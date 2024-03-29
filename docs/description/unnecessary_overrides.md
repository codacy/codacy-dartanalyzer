**DON'T** override a method to do a super method invocation with same parameters.

**BAD:**
```dart
class A extends B {
  @override
  void foo() {
    super.foo();
  }
}
```

**GOOD:**
```dart
class A extends B {
  @override
  void foo() {
    doSomethingElse();
  }
}
```

It's valid to override a member in the following cases:

* if a type (return type or a parameter type) is not the exactly the same as the
  super member,
* if the `covariant` keyword is added to one of the parameters,
* if documentation comments are present on the member,
* if the member has annotations other than `@override`,
* if the member is not annotated with `@protected`, and the super member is.

`noSuchMethod` is a special method and is not checked by this rule.

