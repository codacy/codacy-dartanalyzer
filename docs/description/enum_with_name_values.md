#### Description

The analyzer produces this diagnostic when an enum is declared to have the
name `values`. This isn't allowed because the enum has an implicit static
field named `values`, and the two would collide.

#### Example

The following code produces this diagnostic because there's an enum
declaration that has the name `values`:

```dart
enum [!values!] {
  c
}
```

#### Common fixes

Rename the enum to something other than `values`.