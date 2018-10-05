//#Patterns: comma

//#Issue: {"severity": "Info", "line": 9, "patternId": "comma"}
//#Issue: {"severity": "Info", "line": 11, "patternId": "comma"}
//#Issue: {"severity": "Info", "line": 13, "patternId": "comma"}
//#Issue: {"severity": "Info", "line": 15, "patternId": "comma"}
//#Issue: {"severity": "Info", "line": 18, "patternId": "comma"}

    func abc(a: String ,b: String) { }

    func abc(a: String ,b: String↓ ,c: String↓ ,d: String) { }

    abc(a: "string",b: "string"

    enum a { case a ,b }

    let result = plus(
        first: 3 , // #683
        second: 4
    )
