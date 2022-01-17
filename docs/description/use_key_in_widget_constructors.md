**DO** use key in widget constructors.

It's a good practice to expose the ability to provide a key when creating public
widgets.

**BAD:**
```dart
class MyPublicWidget extends StatelessWidget {
}
```

**GOOD:**
```dart
class MyPublicWidget extends StatelessWidget {
  MyPublicWidget({Key? key}) : super(key: key);
}
```
