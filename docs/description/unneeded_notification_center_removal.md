# Unneeded NotificationCenter Removal

Observers are automatically unregistered on dealloc (iOS 9 / macOS 10.11) so you should't call `removeObserver(self)` in the deinit.

* **Identifier:** unneeded_notification_center_removal
* **Enabled by default:** Enabled
* **Supports autocorrection:** No
* **Kind:** lint
* **Analyzer rule:** No
* **Minimum Swift compiler version:** 3.0.0
* **Default configuration:** warning

## Non Triggering Examples

```swift
class Example {
    deinit {
        NotificationCenter.default.removeObserver(someOtherObserver)
    }
}
```

```swift
class Example {
    func removeObservers() {
        NotificationCenter.default.removeObserver(self)
    }
}
```

```swift
class Example {
    deinit {
        cleanup()
    }
}
```

## Triggering Examples

```swift
class Foo {
    deinit {
        NotificationCenter.default.removeObserver(↓self)
    }
}
```

```swift
class Foo {
    deinit {
        NotificationCenter.default.removeObserver(↓self,
                                                  name: UITextView.textDidChangeNotification, object: nil)
    }
}
```