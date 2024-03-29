**AVOID** using unnecessary statements.

Statements which have no clear effect are usually unnecessary, or should be
broken up.

For example,

**BAD:**
```dart
myvar;
list.clear;
1 + 2;
methodOne() + methodTwo();
foo ? bar : baz;
```

Though the added methods have a clear effect, the addition itself does not
unless there is some magical overload of the + operator.

Usually code like this indicates an incomplete thought, and is a bug.

**GOOD:**
```dart
some.method();
const SomeClass();
methodOne();
methodTwo();
foo ? bar() : baz();
return myvar;
```

