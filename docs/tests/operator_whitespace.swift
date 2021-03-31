//#Patterns: operator_whitespace

//#Issue: {"severity": "Warning", "line": 10, "patternId": "operator_whitespace"}
//#Issue: {"severity": "Warning", "line": 13, "patternId": "operator_whitespace"}
//#Issue: {"severity": "Warning", "line": 16, "patternId": "operator_whitespace"}
//#Issue: {"severity": "Warning", "line": 19, "patternId": "operator_whitespace"}
//#Issue: {"severity": "Warning", "line": 22, "patternId": "operator_whitespace"}
//#Issue: {"severity": "Warning", "line": 25, "patternId": "operator_whitespace"}

    func <|(lhs: Int, rhs: Int) -> Int {}


    func <|<<A>(lhs: A, rhs: A) -> A {}


    func <|  (lhs: Int, rhs: Int) -> Int {}


    func <|<  <A>(lhs: A, rhs: A) -> A {}


    func  <| (lhs: Int, rhs: Int) -> Int {}


    func  <|< <A>(lhs: A, rhs: A) -> A {}
