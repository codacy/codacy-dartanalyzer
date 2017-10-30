//#Patterns: redundant_string_enum_value

//#Issue: {"severity": "Info", "line": 9, "patternId": "redundant_string_enum_value"}
//#Issue: {"severity": "Info", "line": 10, "patternId": "redundant_string_enum_value"}
//#Issue: {"severity": "Info", "line": 15, "patternId": "redundant_string_enum_value"}
//#Issue: {"severity": "Info", "line": 20, "patternId": "redundant_string_enum_value"}

    enum Numbers: String {
     case one = "one"
     case two = "two"
    }


    enum Numbers: String {
     case one = "one", two = ↓"two"
    }


    enum Numbers: String {
     case one, two = "two"
    }
