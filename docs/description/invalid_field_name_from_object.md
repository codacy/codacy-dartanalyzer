#### Description

The analyzer produces this diagnostic when either a record literal or a
record type annotation has a field whose name is invalid. The name is
invalid if it is:
- private (starts with `_`)
- the same as one of the members defined on `Object`
- the same as the name of a positional field (an exception is made if the
  field is a positional field with the specified name)

#### Examples

The following code produces this diagnostic because the record literal has
a field named `toString`, which is a method defined on `Object`:

```dart
var r = (a: 1, [!toString!]: 4);
```

The following code produces this diagnostic because the record type
annotation has a field named `hashCode`, which is a getter defined on
`Object`:

```dart
void f(({int a, int [!hashCode!]}) r) {}
```

The following code produces this diagnostic because the record literal has
a private field named `_a`:

```dart
var r = ([!_a!]: 1, b: 2);
```

The following code produces this diagnostic because the record type
annotation has a private field named `_a`:

```dart
void f(({int [!_a!], int b}) r) {}
```

The following code produces this diagnostic because the record literal has
a field named `$1`, which is also the name of a different positional
parameter:

```dart
var r = (2, [!$1!]: 1);
```

The following code produces this diagnostic because the record type
annotation has a field named `$1`, which is also the name of a different
positional parameter:

```dart
void f((int, String, {int [!$1!]}) r) {}
```

#### Common fixes

Rename the field:

```dart
var r = (a: 1, d: 4);
```