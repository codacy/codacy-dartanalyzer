
**DO** use a setter for operations that conceptually change a property.

**BAD:**
```dart
rectangle.setWidth(3);
button.setVisible(false);
```

**GOOD:**
```dart
rectangle.width = 3;
button.visible = false;
```

