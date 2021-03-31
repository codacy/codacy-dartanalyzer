//#Patterns: redundant_discardable_let

//#Issue: {"severity": "Warning", "line": 6, "patternId": "redundant_discardable_let"}
//#Issue: {"severity": "Warning", "line": 9, "patternId": "redundant_discardable_let"}

    let _ = foo()


    if _ = foo() { let _ = bar() }
