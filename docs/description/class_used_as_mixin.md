#### Description

The analyzer produces this diagnostic when a class that is neither a
`mixin class` nor a `mixin` is used in a `with` clause.

#### Example

The following code produces this diagnostic because the class `M` is being
used as a mixin, but it isn't defined as a `mixin class`:

```dart
class M {}
class C with [!M!] {}
```

#### Common fixes

If the class can be a pure mixin, then change `class` to `mixin`:

```dart
mixin M {}
class C with M {}
```

If the class needs to be both a class and a mixin, then add `mixin`:

```dart
mixin class M {}
class C with M {}
```