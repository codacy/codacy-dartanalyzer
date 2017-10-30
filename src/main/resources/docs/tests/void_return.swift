//#Patterns: void_return

//#Issue: {"severity": "Info", "line": 11, "patternId": "void_return"}
//#Issue: {"severity": "Info", "line": 14, "patternId": "void_return"}
//#Issue: {"severity": "Info", "line": 17, "patternId": "void_return"}
//#Issue: {"severity": "Info", "line": 20, "patternId": "void_return"}
//#Issue: {"severity": "Info", "line": 23, "patternId": "void_return"}
//#Issue: {"severity": "Info", "line": 26, "patternId": "void_return"}
//#Issue: {"severity": "Info", "line": 29, "patternId": "void_return"}

    let abc: () -> () = {}


    let abc: () -> (Void) = {}


    let abc: () -> (   Void ) = {}


    func foo(completion: () -> ())


    func foo(completion: () -> (   ))


    func foo(completion: () -> (Void))


    let foo: (ConfigurationTests) -> () throws -> ())


asd
