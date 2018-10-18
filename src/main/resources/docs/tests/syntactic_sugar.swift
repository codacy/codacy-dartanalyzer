//#Patterns: syntactic_sugar

//#Issue: {"severity": "Info", "line": 14, "patternId": "syntactic_sugar"}
//#Issue: {"severity": "Info", "line": 16, "patternId": "syntactic_sugar"}
//#Issue: {"severity": "Info", "line": 18, "patternId": "syntactic_sugar"}
//#Issue: {"severity": "Info", "line": 20, "patternId": "syntactic_sugar"}
//#Issue: {"severity": "Info", "line": 22, "patternId": "syntactic_sugar"}
//#Issue: {"severity": "Info", "line": 24, "patternId": "syntactic_sugar"}
//#Issue: {"severity": "Info", "line": 26, "patternId": "syntactic_sugar"}
//#Issue: {"severity": "Info", "line": 26, "patternId": "syntactic_sugar"}
//#Issue: {"severity": "Info", "line": 28, "patternId": "syntactic_sugar"}
//#Issue: {"severity": "Info", "line": 30, "patternId": "syntactic_sugar"}

    let x: Array<String>

    let x: Dictionary<Int, String>

    let x: Optional<Int>

    let x: ImplicitlyUnwrappedOptional<Int>

    func x(a: Array<Int>, b: Int) -> [Int: Any]

    func x(a: [Int], b: Int) -> Dictionary<Int, String>

    func x(a: Array<Int>, b: Int) -> ↓Dictionary<Int, String>

    let x = Array<String>.array(of: object)

    let x: Swift.Optional<String>
