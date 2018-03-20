//#Patterns: block_based_kvo

//#Issue: {"severity": "Info", "line": 9, "patternId": "block_based_kvo"}
//#Issue: {"severity": "Info", "line": 16, "patternId": "block_based_kvo"}



class Foo: NSObject {
    override func observeValue(forKeyPath keyPath: String?, of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?,
                               context: UnsafeMutableRawPointer?) {}
}


class Foo: NSObject {
    override func observeValue(forKeyPath keyPath: String?, of object: Any?,
                               change: Dictionary<NSKeyValueChangeKey, Any>?,
                               context: UnsafeMutableRawPointer?) {}
}
