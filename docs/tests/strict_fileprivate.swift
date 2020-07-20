//#Patterns: strict_fileprivate

//#Issue: {"severity": "Info", "line": 12, "patternId": "strict_fileprivate"}
//#Issue: {"severity": "Info", "line": 15, "patternId": "strict_fileprivate"}
//#Issue: {"severity": "Info", "line": 19, "patternId": "strict_fileprivate"}
//#Issue: {"severity": "Info", "line": 24, "patternId": "strict_fileprivate"}
//#Issue: {"severity": "Info", "line": 29, "patternId": "strict_fileprivate"}
//#Issue: {"severity": "Info", "line": 34, "patternId": "strict_fileprivate"}
//#Issue: {"severity": "Info", "line": 40, "patternId": "strict_fileprivate"}


fileprivate extension String {}


fileprivate
extension String {}


fileprivate extension
String {}


extension String {
    fileprivate func Something(){}
}


class MyClass {
    fileprivate let myInt = 4
}


class MyClass {
    fileprivate(set) var myInt = 4
}


struct Outter {
    struct Inter {
        fileprivate struct Inner {}
    }
}
