#### Description

The analyzer produces this diagnostic when one class is listed in both the
`extends` and `implements` clauses of another class.

#### Example

The following code produces this diagnostic because the class `A` is used
in both the `extends` and `implements` clauses for the class `B`:

```dart
class A {}

class B extends A implements [!A!] {}
```

#### Common fixes

If you want to inherit the implementation from the class, then remove the
class from the `implements` clause:

```dart
class A {}

class B extends A {}
```

If you don't want to inherit the implementation from the class, then remove
the `extends` clause:

```dart
class A {}

class B implements A {}
```