//#Patterns: array_init

//#Issue: {"severity": "Warning", "line": 12, "patternId": "array_init"}
//#Issue: {"severity": "Warning", "line": 16, "patternId": "array_init"}
//#Issue: {"severity": "Warning", "line": 20, "patternId": "array_init"}
//#Issue: {"severity": "Warning", "line": 24, "patternId": "array_init"}
//#Issue: {"severity": "Warning", "line": 30, "patternId": "array_init"}
//#Issue: {"severity": "Warning", "line": 36, "patternId": "array_init"}
//#Issue: {"severity": "Warning", "line": 42, "patternId": "array_init"}
//#Issue: {"severity": "Warning", "line": 48, "patternId": "array_init"}

foo.map({ $0 })



foo.map { $0 }



foo.map { return $0 }



foo.map { elem in
    elem
}



foo.map { elem in
    return elem
}



foo.map { (elem: String) in
    elem
}



foo.map { elem -> String in
    elem
}



foo.map { $0 /* a comment */ }
