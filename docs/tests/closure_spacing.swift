//#Patterns: closure_spacing

//#Issue: {"severity": "Warning", "line": 8, "patternId": "closure_spacing"}
//#Issue: {"severity": "Warning", "line": 10, "patternId": "closure_spacing"}
//#Issue: {"severity": "Warning", "line": 12, "patternId": "closure_spacing"}
//#Issue: {"severity": "Warning", "line": 14, "patternId": "closure_spacing"}

    [].filter({$0.contains(location)})

    [].map({$0})

    ({each in return result.contains(where: ↓{e in return e}) }).count

    filter { sorted ↓{ $0 < $1}}
