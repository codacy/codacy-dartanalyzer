//#Patterns: unneeded_parentheses_in_closure_argument

//#Issue: {"severity": "Warning", "line": 10, "patternId": "unneeded_parentheses_in_closure_argument"}
//#Issue: {"severity": "Warning", "line": 14, "patternId": "unneeded_parentheses_in_closure_argument"}
//#Issue: {"severity": "Warning", "line": 18, "patternId": "unneeded_parentheses_in_closure_argument"}
//#Issue: {"severity": "Warning", "line": 22, "patternId": "unneeded_parentheses_in_closure_argument"}
//#Issue: {"severity": "Warning", "line": 25, "patternId": "unneeded_parentheses_in_closure_argument"}


call(arg: { (bar) in })



call(arg: { (bar, _) in })



let foo = { (bar) -> Bool in return true }



foo.map { ($0, $0) }.forEach { (x, y) in }


foo.bar { [weak self] (x, y) in }
