#### Description

The analyzer produces this diagnostic when a key is used in a
`pubspec.yaml` file that was deprecated. Unused keys take up space and
might imply semantics that are no longer valid.

#### Example

The following code produces this diagnostic because the `author` key is no
longer being used:

```dart
%uri="pubspec.yaml"
name: example
author: 'Dash'
```

#### Common fixes

Remove the deprecated key:

```dart
%uri="pubspec.yaml"
name: example
```