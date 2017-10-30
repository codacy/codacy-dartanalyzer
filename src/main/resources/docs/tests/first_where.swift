//#Patterns: first_where

//#Issue: {"severity": "Info", "line": 10, "patternId": "first_where"}
//#Issue: {"severity": "Info", "line": 13, "patternId": "first_where"}
//#Issue: {"severity": "Info", "line": 16, "patternId": "first_where"}
//#Issue: {"severity": "Info", "line": 19, "patternId": "first_where"}
//#Issue: {"severity": "Info", "line": 22, "patternId": "first_where"}
//#Issue: {"severity": "Info", "line": 25, "patternId": "first_where"}

    myList.filter { $0 % 2 == 0 }.first


    myList.filter({ $0 % 2 == 0 }).first


    myList.map { $0 + 1 }.filter({ $0 % 2 == 0 }).first


    myList.map { $0 + 1 }.filter({ $0 % 2 == 0 }).first?.something()


    myList.filter(someFunction).first


    myList.filter({ $0 % 2 == 0 })
    .first
