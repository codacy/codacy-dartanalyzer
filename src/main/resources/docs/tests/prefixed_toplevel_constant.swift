//#Patterns: prefixed_toplevel_constant

//#Issue: {"severity": "Info", "line": 14, "patternId": "prefixed_toplevel_constant"}
//#Issue: {"severity": "Info", "line": 17, "patternId": "prefixed_toplevel_constant"}
//#Issue: {"severity": "Info", "line": 20, "patternId": "prefixed_toplevel_constant"}
//#Issue: {"severity": "Info", "line": 23, "patternId": "prefixed_toplevel_constant"}
//#Issue: {"severity": "Info", "line": 26, "patternId": "prefixed_toplevel_constant"}
//#Issue: {"severity": "Info", "line": 29, "patternId": "prefixed_toplevel_constant"}
//#Issue: {"severity": "Info", "line": 33, "patternId": "prefixed_toplevel_constant"}
//#Issue: {"severity": "Info", "line": 36, "patternId": "prefixed_toplevel_constant"}



private let Foo = 20.0


public let Foo = false


internal let Foo = "Foo"


let Foo = true


let foo = 2, ↓bar = true


var foo = true, let Foo = true


let
foo = true


let foo = {
    return a + b
}()
