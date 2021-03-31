//#Patterns: redundant_nil_coalescing

//#Issue: {"severity": "Warning", "line": 6, "patternId": "redundant_nil_coalescing"}
//#Issue: {"severity": "Warning", "line": 9, "patternId": "redundant_nil_coalescing"}

    var myVar: Int? = nil; myVar ?? nil


    var myVar: Int? = nil; myVar??nil
