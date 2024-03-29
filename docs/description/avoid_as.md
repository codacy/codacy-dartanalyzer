**AVOID** using `as`.

If you know the type is correct, use an assertion or assign to a more
narrowly-typed variable (this avoids the type check in release mode; `as` is not
compiled out in release mode).  If you don't know whether the type is
correct, check using `is` (this avoids the exception that `as` raises).

**BAD:**
```dart
(pm as Person).firstName = 'Seth';
```

**GOOD:**
```dart
if (pm is Person)
  pm.firstName = 'Seth';
```

but certainly not

**BAD:**
```dart
try {
   (pm as Person).firstName = 'Seth';
} on CastError { }
```

Note that an exception is made in the case of `dynamic` since the cast has no
performance impact.

**OK:**
```dart
HasScrollDirection scrollable = renderObject as dynamic;
```


**DEPRECATED:** This advice is no longer recommended.
 
The rule will be removed in a future Linter release.
