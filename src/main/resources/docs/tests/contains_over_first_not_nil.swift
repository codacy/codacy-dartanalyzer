//#Patterns: contains_over_first_not_nil

//#Issue: {"severity": "Info", "line": 12, "patternId": "contains_over_first_not_nil"}
//#Issue: {"severity": "Info", "line": 16, "patternId": "contains_over_first_not_nil"}
//#Issue: {"severity": "Info", "line": 20, "patternId": "contains_over_first_not_nil"}
//#Issue: {"severity": "Info", "line": 24, "patternId": "contains_over_first_not_nil"}
//#Issue: {"severity": "Info", "line": 28, "patternId": "contains_over_first_not_nil"}
//#Issue: {"severity": "Info", "line": 32, "patternId": "contains_over_first_not_nil"}



myList.first { $0 % 2 == 0 } != nil



myList.first(where: { $0 % 2 == 0 }) != nil



myList.map { $0 + 1 }.first(where: { $0 % 2 == 0 }) != nil



myList.first(where: someFunction) != nil



myList.map { $0 + 1 }.first { $0 % 2 == 0 } != nil



(myList.first { $0 % 2 == 0 }) != nil
