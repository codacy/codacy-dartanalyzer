//#Patterns: syntactic_sugar

//#Issue: {"severity": "Info", "line": 13, "patternId": "syntactic_sugar"}
//#Issue: {"severity": "Info", "line": 15, "patternId": "syntactic_sugar"}
//#Issue: {"severity": "Info", "line": 17, "patternId": "syntactic_sugar"}
//#Issue: {"severity": "Info", "line": 19, "patternId": "syntactic_sugar"}
//#Issue: {"severity": "Info", "line": 21, "patternId": "syntactic_sugar"}
//#Issue: {"severity": "Info", "line": 23, "patternId": "syntactic_sugar"}
//#Issue: {"severity": "Info", "line": 25, "patternId": "syntactic_sugar"}
//#Issue: {"severity": "Info", "line": 27, "patternId": "syntactic_sugar"}
//#Issue: {"severity": "Info", "line": 29, "patternId": "syntactic_sugar"}

    let x: Array<String>

    let x: Dictionary<Int, String>

    let x: Optional<Int>

    let x: ImplicitlyUnwrappedOptional<Int>

    func x(a: Array<Int>, b: Int) -> [Int: Any]

    func x(a: [Int], b: Int) -> Dictionary<Int, String>

    func x(a: Array<Int>, b: Int) -> ↓Dictionary<Int, String>

    let x = Array<String>.array(of: object)

    let x: Swift.Optional<String>
