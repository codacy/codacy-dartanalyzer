//#Patterns: empty_parameters

//#Issue: {"severity": "Warning", "line": 8, "patternId": "empty_parameters"}
//#Issue: {"severity": "Warning", "line": 11, "patternId": "empty_parameters"}
//#Issue: {"severity": "Warning", "line": 14, "patternId": "empty_parameters"}
//#Issue: {"severity": "Warning", "line": 17, "patternId": "empty_parameters"}

    let abc: (Void) -> Void = {}


    func foo(completion: (Void) -> Void)


    func foo(completion: (Void) throws -> Void)


    let foo: (Void) -> () throws -> Void)
