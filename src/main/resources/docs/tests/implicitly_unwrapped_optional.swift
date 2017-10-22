//#Patterns: implicitly_unwrapped_optional

//#Issue: {"severity": "Info", "line": 15, "patternId": "implicitly_unwrapped_optional"}
//#Issue: {"severity": "Info", "line": 17, "patternId": "implicitly_unwrapped_optional"}
//#Issue: {"severity": "Info", "line": 19, "patternId": "implicitly_unwrapped_optional"}
//#Issue: {"severity": "Info", "line": 21, "patternId": "implicitly_unwrapped_optional"}
//#Issue: {"severity": "Info", "line": 23, "patternId": "implicitly_unwrapped_optional"}
//#Issue: {"severity": "Info", "line": 25, "patternId": "implicitly_unwrapped_optional"}
//#Issue: {"severity": "Info", "line": 27, "patternId": "implicitly_unwrapped_optional"}
//#Issue: {"severity": "Info", "line": 29, "patternId": "implicitly_unwrapped_optional"}
//#Issue: {"severity": "Info", "line": 31, "patternId": "implicitly_unwrapped_optional"}
//#Issue: {"severity": "Info", "line": 33, "patternId": "implicitly_unwrapped_optional"}
//#Issue: {"severity": "Info", "line": 35, "patternId": "implicitly_unwrapped_optional"}

    let label: UILabel!

    let IBOutlet: UILabel!

    let labels: [UILabel!]

    var ints: [Int!] = [42, nil, 42]

    let label: IBOutlet!

    let int: Int! = 42

    let int: Int! = nil

    var int: Int! = 42

    let int: ImplicitlyUnwrappedOptional<Int>

    let collection: AnyCollection<Int!>

    func foo(int: Int!) {}
