//#Patterns: empty_parentheses_with_trailing_closure

//#Issue: {"severity": "Warning", "line": 8, "patternId": "empty_parentheses_with_trailing_closure"}
//#Issue: {"severity": "Warning", "line": 11, "patternId": "empty_parentheses_with_trailing_closure"}
//#Issue: {"severity": "Warning", "line": 14, "patternId": "empty_parentheses_with_trailing_closure"}
//#Issue: {"severity": "Warning", "line": 19, "patternId": "empty_parentheses_with_trailing_closure"}

    [1, 2].map() { $0 + 1 }


    [1, 2].map( ) { $0 + 1 }


    [1, 2].map() { number in
     number + 1
    }


    [1, 2].map(  ) { number in
     number + 1
    }
