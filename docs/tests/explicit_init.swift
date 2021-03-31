//#Patterns: explicit_init

//#Issue: {"severity": "Warning", "line": 6, "patternId": "explicit_init"}
//#Issue: {"severity": "Warning", "line": 8, "patternId": "explicit_init"}

    [1].flatMap{String.init($0)}

    [String.self].map { Type in Type.init(1) }
