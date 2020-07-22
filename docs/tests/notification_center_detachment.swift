//#Patterns: notification_center_detachment

//#Issue: {"severity": "Info", "line": 7, "patternId": "notification_center_detachment"}

    class Foo {
       func bar() {
           NotificationCenter.default.removeObserver(self)
       }
    }
