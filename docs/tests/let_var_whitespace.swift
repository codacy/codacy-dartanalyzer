//#Patterns: let_var_whitespace

//#Issue: {"severity": "Warning", "line": 12, "patternId": "let_var_whitespace"}
//#Issue: {"severity": "Warning", "line": 18, "patternId": "let_var_whitespace"}
//#Issue: {"severity": "Warning", "line": 24, "patternId": "let_var_whitespace"}
//#Issue: {"severity": "Warning", "line": 30, "patternId": "let_var_whitespace"}
//#Issue: {"severity": "Warning", "line": 35, "patternId": "let_var_whitespace"}
//#Issue: {"severity": "Warning", "line": 42, "patternId": "let_var_whitespace"}


var x = 1
x = 2




a = 5
var x = 1



struct X {
    let a
    func x() {}
}



var x = 0
@objc func f() {}



var x = 0
@objc
func f() {}



@objc func f() {
}
var x = 0
