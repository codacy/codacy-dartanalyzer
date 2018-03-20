//#Patterns: sorted_first_last

//#Issue: {"severity": "Info", "line": 18, "patternId": "sorted_first_last"}
//#Issue: {"severity": "Info", "line": 22, "patternId": "sorted_first_last"}
//#Issue: {"severity": "Info", "line": 26, "patternId": "sorted_first_last"}
//#Issue: {"severity": "Info", "line": 30, "patternId": "sorted_first_last"}
//#Issue: {"severity": "Info", "line": 34, "patternId": "sorted_first_last"}
//#Issue: {"severity": "Info", "line": 38, "patternId": "sorted_first_last"}
//#Issue: {"severity": "Info", "line": 42, "patternId": "sorted_first_last"}
//#Issue: {"severity": "Info", "line": 46, "patternId": "sorted_first_last"}
//#Issue: {"severity": "Info", "line": 50, "patternId": "sorted_first_last"}
//#Issue: {"severity": "Info", "line": 54, "patternId": "sorted_first_last"}
//#Issue: {"severity": "Info", "line": 58, "patternId": "sorted_first_last"}
//#Issue: {"severity": "Info", "line": 62, "patternId": "sorted_first_last"}
//#Issue: {"severity": "Info", "line": 66, "patternId": "sorted_first_last"}


myList.sorted().first



myList.sorted(by: { $0.description < $1.description }).first



myList.sorted(by: >).first



myList.map { $0 + 1 }.sorted().first



myList.sorted(by: someFunction).first



myList.map { $0 + 1 }.sorted { $0.description < $1.description }.first



myList.sorted().last



myList.sorted().last?.something()



myList.sorted(by: { $0.description < $1.description }).last



myList.map { $0 + 1 }.sorted().last



myList.sorted(by: someFunction).last



myList.map { $0 + 1 }.sorted { $0.description < $1.description }.last



myList.map { $0 + 1 }.sorted { $0.first < $1.first }.last
