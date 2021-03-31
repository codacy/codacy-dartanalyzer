//#Patterns: fallthrough

//#Issue: {"severity": "Warning", "line": 9, "patternId": "fallthrough"}



switch foo {
case .bar:
    fallthrough
case .bar2:
    something()
}
