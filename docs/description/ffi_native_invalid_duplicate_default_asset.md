#### Description

The analyzer produces this diagnostic when a library directive has more
than one `DefaultAsset` annotation associated with it.

#### Example

The following code produces this diagnostic because the library directive
has two `DefaultAsset` annotations associated with it:

```dart
@DefaultAsset('a')
@[!DefaultAsset!]('b')
library;

import 'dart:ffi';
```

#### Common fixes

Remove all but one of the `DefaultAsset` annotations:

```dart
@DefaultAsset('a')
library;

import 'dart:ffi';
```