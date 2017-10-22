//#Patterns: redundant_nil_coalescing

//#Issue: {"severity": "Info", "line": 6, "patternId": "redundant_nil_coalescing"}
//#Issue: {"severity": "Info", "line": 9, "patternId": "redundant_nil_coalescing"}

    var myVar: Int? = nil; myVar ?? nil


    var myVar: Int? = nil; myVar??nil
