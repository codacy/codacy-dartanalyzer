**AVOID** positional boolean parameters.

Positional boolean parameters are a bad practice because they are very
ambiguous.  Using named boolean parameters is much more readable because it
inherently describes what the boolean value represents.

**BAD:**
```dart
Task(true);
Task(false);
ListBox(false, true, true);
Button(false);
```

**GOOD:**
```dart
Task.oneShot();
Task.repeating();
ListBox(scroll: true, showScrollbars: true);
Button(ButtonState.enabled);
```

