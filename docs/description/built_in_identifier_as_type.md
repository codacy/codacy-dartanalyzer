#### Description

The analyzer produces this diagnostic when a built-in identifier is used
where a type name is expected.

#### Example

The following code produces this diagnostic because `import` can't be used
as a type because it's a built-in identifier:

```dart
[!import!]<int> x;
```

#### Common fixes

Replace the built-in identifier with the name of a valid type:

```dart
List<int> x;
```