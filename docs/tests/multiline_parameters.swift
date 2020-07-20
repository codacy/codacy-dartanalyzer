//#Patterns: multiline_parameters

//#Issue: {"severity": "Info", "line": 23, "patternId": "multiline_parameters"}
//#Issue: {"severity": "Info", "line": 29, "patternId": "multiline_parameters"}
//#Issue: {"severity": "Info", "line": 34, "patternId": "multiline_parameters"}
//#Issue: {"severity": "Info", "line": 39, "patternId": "multiline_parameters"}
//#Issue: {"severity": "Info", "line": 44, "patternId": "multiline_parameters"}
//#Issue: {"severity": "Info", "line": 49, "patternId": "multiline_parameters"}
//#Issue: {"severity": "Info", "line": 54, "patternId": "multiline_parameters"}
//#Issue: {"severity": "Info", "line": 59, "patternId": "multiline_parameters"}
//#Issue: {"severity": "Info", "line": 64, "patternId": "multiline_parameters"}
//#Issue: {"severity": "Info", "line": 69, "patternId": "multiline_parameters"}
//#Issue: {"severity": "Info", "line": 74, "patternId": "multiline_parameters"}
//#Issue: {"severity": "Info", "line": 79, "patternId": "multiline_parameters"}
//#Issue: {"severity": "Info", "line": 84, "patternId": "multiline_parameters"}
//#Issue: {"severity": "Info", "line": 89, "patternId": "multiline_parameters"}
//#Issue: {"severity": "Info", "line": 94, "patternId": "multiline_parameters"}
//#Issue: {"severity": "Info", "line": 99, "patternId": "multiline_parameters"}
//#Issue: {"severity": "Info", "line": 104, "patternId": "multiline_parameters"}
//#Issue: {"severity": "Info", "line": 109, "patternId": "multiline_parameters"}
//#Issue: {"severity": "Info", "line": 114, "patternId": "multiline_parameters"}

    func foo(_ param1: Int,
              param2: Int, param3: Int) -> (Int) -> Int {
       return { x in x + param1 + param2 + param3 }
    }

    protocol Foo {
       func foo(param1: Int,
                 param2: Bool, param3: [String]) { }
    }

    protocol Foo {
       func foo(param1: Int, param2: Bool,
                 param3: [String]) { }
    }

    protocol Foo {
       static func foo(param1: Int,
                        param2: Bool, param3: [String]) { }
    }

    protocol Foo {
       static func foo(param1: Int, param2: Bool,
                        param3: [String]) { }
    }

    protocol Foo {
       class func foo(param1: Int,
                       param2: Bool, param3: [String]) { }
    }

    protocol Foo {
       class func foo(param1: Int, param2: Bool,
                       param3: [String]) { }
    }

    enum Foo {
       func foo(param1: Int,
                 param2: Bool, param3: [String]) { }
    }

    enum Foo {
       func foo(param1: Int, param2: Bool,
                 param3: [String]) { }
    }

    enum Foo {
       static func foo(param1: Int,
                        param2: Bool, param3: [String]) { }
    }

    enum Foo {
       static func foo(param1: Int, param2: Bool,
                        param3: [String]) { }
    }

    struct Foo {
       func foo(param1: Int,
                 param2: Bool, param3: [String]) { }
    }

    struct Foo {
       func foo(param1: Int, param2: Bool,
                 param3: [String]) { }
    }

    struct Foo {
       static func foo(param1: Int,
                        param2: Bool, param3: [String]) { }
    }

    struct Foo {
       static func foo(param1: Int, param2: Bool,
                        param3: [String]) { }
    }

    class Foo {
       func foo(param1: Int,
                 param2: Bool, param3: [String]) { }
    }

    class Foo {
       func foo(param1: Int, param2: Bool,
                 param3: [String]) { }
    }

    class Foo {
       class func foo(param1: Int,
                       param2: Bool, param3: [String]) { }
    }

    class Foo {
       class func foo(param1: Int, param2: Bool,
                       param3: [String]) { }
    }
