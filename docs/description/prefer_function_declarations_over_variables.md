**DO** use a function declaration to bind a function to a name.

As Dart allows local function declarations, it is a good practice to use them in
the place of function literals.

**BAD:**
```dart
void main() {
  var localFunction = () {
    ...
  };
}
```

**GOOD:**
```dart
void main() {
  localFunction() {
    ...
  }
}
```

