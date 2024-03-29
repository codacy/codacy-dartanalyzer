"Forwarding constructor"s, that do nothing except forward parameters to their 
superclass constructors should take advantage of super-initializer parameters 
rather than repeating the names of parameters when passing them to the 
superclass constructors.  This makes the code more concise and easier to read
and maintain.

**DO** use super-initializer parameters where possible.

**BAD:**
```dart
class A {
  A({int? x, int? y});
}
class B extends A {
  B({int? x, int? y}) : super(x: x, y: y);
}
```

**GOOD:**
```dart
class A {
  A({int? x, int? y});
}
class B extends A {
  B({super.x, super.y});
}
```
