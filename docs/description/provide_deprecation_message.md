**DO** specify a deprecation message (with migration instructions and/or a
removal schedule) in the Deprecation constructor.

**BAD:**
```dart
@deprecated
void oldFunction(arg1, arg2) {}
```

**GOOD:**
```dart
@Deprecated("""
[oldFunction] is being deprecated in favor of [newFunction] (with slightly
different parameters; see [newFunction] for more information). [oldFunction]
will be removed on or after the 4.0.0 release.
""")
void oldFunction(arg1, arg2) {}
```

