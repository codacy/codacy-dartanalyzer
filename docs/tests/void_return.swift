//#Patterns: void_return

//#Issue: {"severity": "Warning", "line": 11, "patternId": "void_return"}
//#Issue: {"severity": "Warning", "line": 14, "patternId": "void_return"}
//#Issue: {"severity": "Warning", "line": 17, "patternId": "void_return"}
//#Issue: {"severity": "Warning", "line": 20, "patternId": "void_return"}
//#Issue: {"severity": "Warning", "line": 23, "patternId": "void_return"}
//#Issue: {"severity": "Warning", "line": 26, "patternId": "void_return"}
//#Issue: {"severity": "Warning", "line": 29, "patternId": "void_return"}

    let abc: () -> () = {}


    let abc: () -> (Void) = {}


    let abc: () -> (   Void ) = {}


    func foo(completion: () -> ())


    func foo(completion: () -> (   ))


    func foo(completion: () -> (Void))


    let foo: (ConfigurationTests) -> () throws -> ())


asd
