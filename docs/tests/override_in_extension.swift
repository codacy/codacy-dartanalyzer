//#Patterns: override_in_extension

//#Issue: {"severity": "Info", "line": 9, "patternId": "override_in_extension"}
//#Issue: {"severity": "Info", "line": 15, "patternId": "override_in_extension"}



extension Person {
    override var age: Int { return 42 }
}



extension Person {
    override func celebrateBirthday() {}
}
