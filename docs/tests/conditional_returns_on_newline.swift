//#Patterns: conditional_returns_on_newline

//#Issue: {"severity": "Info", "line": 9, "patternId": "conditional_returns_on_newline"}
//#Issue: {"severity": "Info", "line": 11, "patternId": "conditional_returns_on_newline"}
//#Issue: {"severity": "Info", "line": 13, "patternId": "conditional_returns_on_newline"}
//#Issue: {"severity": "Info", "line": 15, "patternId": "conditional_returns_on_newline"}
//#Issue: {"severity": "Info", "line": 17, "patternId": "conditional_returns_on_newline"}

    guard true else { return }

    if true { return }

    if true { break } else { return }

    if true { break } else {       return }

    if true { return "YES" } else { return "NO" }
