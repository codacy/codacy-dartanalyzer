//#Patterns: unneeded_break_in_switch

//#Issue: {"severity": "Warning", "line": 12, "patternId": "unneeded_break_in_switch"}
//#Issue: {"severity": "Warning", "line": 19, "patternId": "unneeded_break_in_switch"}
//#Issue: {"severity": "Warning", "line": 26, "patternId": "unneeded_break_in_switch"}
//#Issue: {"severity": "Warning", "line": 33, "patternId": "unneeded_break_in_switch"}


switch foo {
case .bar:
    something()
    break
}


switch foo {
case .bar:
    something()
    break // comment
}


switch foo {
default:
    something()
    break
}


switch foo {
case .foo, .foo2 where condition:
    something()
    break
}
