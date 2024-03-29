#### Description

The analyzer produces this diagnostic when a library that is null safe
imports a library that isn't null safe.

#### Example

Given a file `a.dart` that contains the following:

```dart
%uri="lib/a.dart"
// @dart = 2.9

class A {}
```

The following code produces this diagnostic because a library that null
safe is importing a library that isn't null safe:

```dart
import [!'a.dart'!];

A? f() => null;
```

#### Common fixes

If you can migrate the imported library to be null safe, then migrate it
and update or remove the migrated library's language version.

If you can't migrate the imported library, then the importing library
needs to have a language version that is before 2.12, when null safety was
enabled by default.