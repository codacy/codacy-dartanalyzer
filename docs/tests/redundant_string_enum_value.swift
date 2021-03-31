//#Patterns: redundant_string_enum_value

//#Issue: {"severity": "Warning", "line": 9, "patternId": "redundant_string_enum_value"}
//#Issue: {"severity": "Warning", "line": 10, "patternId": "redundant_string_enum_value"}
//#Issue: {"severity": "Warning", "line": 15, "patternId": "redundant_string_enum_value"}
//#Issue: {"severity": "Warning", "line": 20, "patternId": "redundant_string_enum_value"}

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
