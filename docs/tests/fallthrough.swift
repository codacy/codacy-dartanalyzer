//#Patterns: fallthrough

//#Issue: {"severity": "Info", "line": 9, "patternId": "fallthrough"}



switch foo {
case .bar:
    fallthrough
case .bar2:
    something()
}
