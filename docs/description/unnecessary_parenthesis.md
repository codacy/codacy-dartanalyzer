**AVOID** using parentheses when not needed.

**GOOD:**
```dart
a = b;
```

**BAD:**
```dart
a = (b);
```

Parentheses are considered unnecessary if they do not change the meaning of the
code and they do not improve the readability of the code. The goal is not to
force all developers to maintain the expression precedence table in their heads,
which is why the second condition is included. Examples of this condition
include:

* cascade expressions - it is sometimes not clear what the target of a cascade
  expression is, especially with assignments, or nested cascades. For example,
  the expression `a.b = (c..d)`.
* expressions with whitespace between tokens - it can look very strange to see
  an expression like `!await foo` which is valid and equivalent to
  `!(await foo)`.
* logical expressions - parentheses can improve the readability of the implicit
  grouping defined by precedence. For example, the expression
  `(a && b) || c && d`.
