//#Patterns: redundant_void_return

//#Issue: {"severity": "Info", "line": 8, "patternId": "redundant_void_return"}
//#Issue: {"severity": "Info", "line": 12, "patternId": "redundant_void_return"}
//#Issue: {"severity": "Info", "line": 16, "patternId": "redundant_void_return"}
//#Issue: {"severity": "Info", "line": 20, "patternId": "redundant_void_return"}

    func foo() -> Void {}


    protocol Foo {
     func foo() -> Void
    }


    func foo() -> () {}


    protocol Foo {
     func foo() -> ()
    }
