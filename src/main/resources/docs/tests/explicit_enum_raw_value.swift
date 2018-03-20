//#Patterns: explicit_enum_raw_value

//#Issue: {"severity": "Info", "line": 12, "patternId": "explicit_enum_raw_value"}
//#Issue: {"severity": "Info", "line": 18, "patternId": "explicit_enum_raw_value"}
//#Issue: {"severity": "Info", "line": 24, "patternId": "explicit_enum_raw_value"}
//#Issue: {"severity": "Info", "line": 25, "patternId": "explicit_enum_raw_value"}
//#Issue: {"severity": "Info", "line": 31, "patternId": "explicit_enum_raw_value"}



enum Numbers: Int {
    case one = 10, two, three = 30
}



enum Numbers: NSInteger {
    case one
}



enum Numbers: String {
    case one
    case two
}



enum Numbers: String {
    case one, two = "two"
}



enum Numbers: Decimal {
    case one, ↓two
}
