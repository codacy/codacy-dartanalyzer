//#Patterns: large_tuple

//#Issue: {"severity": "Info", "line": 16, "patternId": "large_tuple"}
//#Issue: {"severity": "Info", "line": 19, "patternId": "large_tuple"}
//#Issue: {"severity": "Info", "line": 22, "patternId": "large_tuple"}
//#Issue: {"severity": "Info", "line": 25, "patternId": "large_tuple"}
//#Issue: {"severity": "Info", "line": 28, "patternId": "large_tuple"}
//#Issue: {"severity": "Info", "line": 31, "patternId": "large_tuple"}
//#Issue: {"severity": "Info", "line": 34, "patternId": "large_tuple"}
//#Issue: {"severity": "Info", "line": 37, "patternId": "large_tuple"}
//#Issue: {"severity": "Info", "line": 40, "patternId": "large_tuple"}
//#Issue: {"severity": "Info", "line": 43, "patternId": "large_tuple"}
//#Issue: {"severity": "Info", "line": 46, "patternId": "large_tuple"}
//#Issue: {"severity": "Info", "line": 49, "patternId": "large_tuple"}

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
