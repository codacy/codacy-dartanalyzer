#### Description

The analyzer produces this diagnostic when a URI in a directive doesn't
conform to the syntax of a valid URI.

#### Example

The following code produces this diagnostic because `'#'` isn't a valid
URI:

```dart
import [!'#'!];
```

#### Common fixes

Replace the invalid URI with a valid URI.