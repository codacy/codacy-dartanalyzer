//#Patterns: redundant_optional_initialization

//#Issue: {"severity": "Info", "line": 8, "patternId": "redundant_optional_initialization"}
//#Issue: {"severity": "Info", "line": 11, "patternId": "redundant_optional_initialization"}
//#Issue: {"severity": "Info", "line": 14, "patternId": "redundant_optional_initialization"}
//#Issue: {"severity": "Info", "line": 17, "patternId": "redundant_optional_initialization"}

    var myVar: Int? = nil


    var myVar: Optional<Int> = nil


    var myVar: Int?=nil


    var myVar: Optional<Int>=nil
