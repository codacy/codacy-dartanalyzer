#### Description

The analyzer produces this diagnostic when an instance field declaration is
found in an extension. It isn't valid to define an instance field because
extensions can only add behavior, not state.

#### Example

The following code produces this diagnostic because `s` is an instance
field:

```dart
extension E on String {
  String [!s!] = '';
}
```

#### Common fixes

If the value can be computed without storing it in a field, then try
using a getter or a method:

```dart
extension E on String {
  String get s => '';
}
```

If the value must be stored, but is the same for every instance,
try using a static field:

```dart
extension E on String {
  static String s = '';
}
```

If each instance needs to have its own value stored, then try
using a getter and setter pair backed by a static `Expando`:

```dart
extension E on String {
  static final _s = Expando<String>();

  String get s => _s[this] ?? '';
  set s(String value) => _s[this] = value;
}
```