//#Patterns: discarded_notification_center_observer

//#Issue: {"severity": "Warning", "line": 7, "patternId": "discarded_notification_center_observer"}
//#Issue: {"severity": "Warning", "line": 10, "patternId": "discarded_notification_center_observer"}
//#Issue: {"severity": "Warning", "line": 14, "patternId": "discarded_notification_center_observer"}

    nc.addObserver(forName: .NSSystemTimeZoneDidChange, object: nil, queue: nil) { }


    nc.addObserver(forName: .NSSystemTimeZoneDidChange, object: nil, queue: nil, using: { })


    @discardableResult func foo() -> Any {
       return nc.addObserver(forName: .NSSystemTimeZoneDidChange, object: nil, queue: nil, using: { })
    }
