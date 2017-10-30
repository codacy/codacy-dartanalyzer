//#Patterns: large_tuple

//#Issue: {"severity": "Info", "line": 17, "patternId": "large_tuple"}
//#Issue: {"severity": "Info", "line": 20, "patternId": "large_tuple"}
//#Issue: {"severity": "Info", "line": 23, "patternId": "large_tuple"}
//#Issue: {"severity": "Info", "line": 26, "patternId": "large_tuple"}
//#Issue: {"severity": "Info", "line": 29, "patternId": "large_tuple"}
//#Issue: {"severity": "Info", "line": 32, "patternId": "large_tuple"}
//#Issue: {"severity": "Info", "line": 35, "patternId": "large_tuple"}
//#Issue: {"severity": "Info", "line": 38, "patternId": "large_tuple"}
//#Issue: {"severity": "Info", "line": 41, "patternId": "large_tuple"}
//#Issue: {"severity": "Info", "line": 44, "patternId": "large_tuple"}
//#Issue: {"severity": "Info", "line": 47, "patternId": "large_tuple"}
//#Issue: {"severity": "Info", "line": 47, "patternId": "large_tuple"}
//#Issue: {"severity": "Info", "line": 50, "patternId": "large_tuple"}

    let foo: (Int, Int, Int)


    let foo: (start: Int, end: Int, value: String)


    let foo: (Int, (Int, Int, Int))


    func foo(bar: (Int, Int, Int))


    func foo() -> (Int, Int, Int)


    func foo() -> (Int, Int, Int) {}


    func foo(bar: String) -> (Int, Int, Int)


    func foo(bar: String) -> (Int, Int, Int) {}


    func foo() throws -> (Int, Int, Int)


    func foo() throws -> (Int, Int, Int) {}


    func foo() throws -> (Int, ↓(String, String, String), Int) {}


    func getDictionaryAndInt() -> (Dictionary<Int, (String, String, String)>, Int)?
