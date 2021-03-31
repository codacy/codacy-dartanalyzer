//#Patterns: unused_closure_parameter

//#Issue: {"severity": "Warning", "line": 12, "patternId": "unused_closure_parameter"}
//#Issue: {"severity": "Warning", "line": 17, "patternId": "unused_closure_parameter"}
//#Issue: {"severity": "Warning", "line": 22, "patternId": "unused_closure_parameter"}
//#Issue: {"severity": "Warning", "line": 27, "patternId": "unused_closure_parameter"}
//#Issue: {"severity": "Warning", "line": 32, "patternId": "unused_closure_parameter"}
//#Issue: {"severity": "Warning", "line": 37, "patternId": "unused_closure_parameter"}
//#Issue: {"severity": "Warning", "line": 41, "patternId": "unused_closure_parameter"}
//#Issue: {"severity": "Warning", "line": 45, "patternId": "unused_closure_parameter"}

    [1, 2].map { number in
     return 3
    }


    [1, 2].map { number in
     return numberWithSuffix
    }


    [1, 2].map { number in
     return 3 // number
    }


    [1, 2].map { number in
     return 3 "number"
    }


    [1, 2].something { number, idx in
     return number
    }


    genericsFunc { (number: TypeA, idx: TypeB) in return idx
    }


    hoge(arg: num) { num in
    }


    fooFunc { 아 in
     }
