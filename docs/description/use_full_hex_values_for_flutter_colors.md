**PREFER** an 8-digit hexadecimal integer(0xFFFFFFFF) to instantiate Color. Colors
have four 8-bit channels, which adds up to 32 bits, so Colors are described
using a 32 bit integer.

**BAD:**
```dart
Color(1);
Color(0x000001);
```

**GOOD:**
```dart
Color(0x00000001);
```

