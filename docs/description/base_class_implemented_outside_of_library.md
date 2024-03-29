#### Description

The analyzer produces this diagnostic when an `extends`, `implements`,
`with`, or `on` clause uses a class or mixin in a way that isn't allowed
given the modifiers on that class or mixin's declaration.

The message specifies how the declaration is being used and why it isn't
allowed.

#### Example

Given a file `a.dart` that defines a base class `A`:

```dart
%uri="lib/a.dart"
base class A {}
```

The following code produces this diagnostic because the class `B`
implements the class `A`, but the `base` modifier prevents `A` from being
implemented outside of the library where it's defined:

```dart
import 'a.dart';

final class B implements [!A!] {}
```

#### Common fixes

Use of this type is restricted outside of its declaring library. If a
different, unrestricted type is available that can provide similar
functionality, then replace the type:

```dart
class B implements C {}
class C {}
```

If there isn't a different type that would be appropriate, then remove the
type, and possibly the whole clause:

```dart
class B {}
```