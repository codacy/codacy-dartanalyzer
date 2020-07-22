//#Patterns: empty_enum_arguments

//#Issue: {"severity": "Info", "line": 9, "patternId": "empty_enum_arguments"}
//#Issue: {"severity": "Info", "line": 13, "patternId": "empty_enum_arguments"}
//#Issue: {"severity": "Info", "line": 17, "patternId": "empty_enum_arguments"}
//#Issue: {"severity": "Info", "line": 21, "patternId": "empty_enum_arguments"}

    switch foo {
        case .bar(_): break
    }

    switch foo {
        case .bar(): break
    }

    switch foo {
        case .bar(_), .bar2↓(_): break
    }

    switch foo {
        case .bar() where method() > 2: break
    }
