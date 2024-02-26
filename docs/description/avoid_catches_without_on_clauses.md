**AVOID** catches without on clauses.

Using catch clauses without on clauses make your code prone to encountering
unexpected errors that won't be thrown (and thus will go unnoticed).

**BAD:**
```dart
try {
 somethingRisky()
}
catch(e) {
  doSomething(e);
}
```

**GOOD:**
```dart
try {
 somethingRisky()
}
on Exception catch(e) {
  doSomething(e);
}
```

