//#Patterns: void_return

//#Issue: {"severity": "Info", "line": 14, "patternId": "void_return"}

    let abc: () -> () = {}


    let abc: () -> (Void) = {}


    let abc: () -> (   Void ) = {}


    func foo(completion: () -> ())


    func foo(completion: () -> (   ))


    func foo(completion: () -> (Void))


    let foo: (ConfigurationTests) -> () throws -> ())
