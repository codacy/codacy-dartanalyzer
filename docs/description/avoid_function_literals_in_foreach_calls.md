**AVOID** using `forEach` with a function literal.

The `for` loop enables a developer to be clear and explicit as to their intent.
A return in the body of the `for` loop returns from the body of the function, 
where as a return in the body of the `forEach` closure only returns a value 
for that iteration of the `forEach`. The body of a `for` loop can contain 
`await`s, while the closure body of a `forEach` cannot.

**BAD:**
```dart
people.forEach((person) {
  ...
});
```

**GOOD:**
```dart
for (var person in people) {
  ...
}
```
