//#Patterns: private_over_fileprivate

//#Issue: {"severity": "Info", "line": 7, "patternId": "private_over_fileprivate"}
//#Issue: {"severity": "Info", "line": 10, "patternId": "private_over_fileprivate"}


fileprivate enum MyEnum {}


fileprivate class MyClass {
    fileprivate(set) var myInt = 4
}
