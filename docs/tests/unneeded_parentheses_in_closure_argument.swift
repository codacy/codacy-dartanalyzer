//#Patterns: unneeded_parentheses_in_closure_argument

//#Issue: {"severity": "Info", "line": 10, "patternId": "unneeded_parentheses_in_closure_argument"}
//#Issue: {"severity": "Info", "line": 14, "patternId": "unneeded_parentheses_in_closure_argument"}
//#Issue: {"severity": "Info", "line": 18, "patternId": "unneeded_parentheses_in_closure_argument"}
//#Issue: {"severity": "Info", "line": 22, "patternId": "unneeded_parentheses_in_closure_argument"}
//#Issue: {"severity": "Info", "line": 25, "patternId": "unneeded_parentheses_in_closure_argument"}


call(arg: { (bar) in })



call(arg: { (bar, _) in })



let foo = { (bar) -> Bool in return true }



foo.map { ($0, $0) }.forEach { (x, y) in }


foo.bar { [weak self] (x, y) in }
