//#Patterns: array_init

//#Issue: {"severity": "Info", "line": 12, "patternId": "array_init"}
//#Issue: {"severity": "Info", "line": 16, "patternId": "array_init"}
//#Issue: {"severity": "Info", "line": 20, "patternId": "array_init"}
//#Issue: {"severity": "Info", "line": 24, "patternId": "array_init"}
//#Issue: {"severity": "Info", "line": 30, "patternId": "array_init"}
//#Issue: {"severity": "Info", "line": 36, "patternId": "array_init"}
//#Issue: {"severity": "Info", "line": 42, "patternId": "array_init"}
//#Issue: {"severity": "Info", "line": 48, "patternId": "array_init"}

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
