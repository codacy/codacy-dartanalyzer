//#Patterns: joined_default_parameter

//#Issue: {"severity": "Warning", "line": 8, "patternId": "joined_default_parameter"}
//#Issue: {"severity": "Warning", "line": 12, "patternId": "joined_default_parameter"}



let foo = bar.joined(separator: "")


let foo = bar.filter(toto)
    .joined(separator: "")
