**PREFER** using `??=` over testing for null.

As Dart has the `??=` operator, it is advisable to use it where applicable to
improve the brevity of your code.

**BAD:**
```dart
String get fullName {
  if (_fullName == null) {
    _fullName = getFullUserName(this);
  }
  return _fullName;
}
```

**GOOD:**
```dart
String get fullName {
  return _fullName ??= getFullUserName(this);
}
```

