//#Patterns: first_where

    myList.filter { $0 % 2 == 0 }.first


    myList.filter({ $0 % 2 == 0 }).first


    myList.map { $0 + 1 }.filter({ $0 % 2 == 0 }).first


    myList.map { $0 + 1 }.filter({ $0 % 2 == 0 }).first?.something()


    myList.filter(someFunction).first


    myList.filter({ $0 % 2 == 0 })
    .first
