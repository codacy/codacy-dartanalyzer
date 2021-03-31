//#Patterns: return_arrow_whitespace

//#Issue: {"severity": "Warning", "line": 12, "patternId": "return_arrow_whitespace"}
//#Issue: {"severity": "Warning", "line": 15, "patternId": "return_arrow_whitespace"}
//#Issue: {"severity": "Warning", "line": 18, "patternId": "return_arrow_whitespace"}
//#Issue: {"severity": "Warning", "line": 21, "patternId": "return_arrow_whitespace"}
//#Issue: {"severity": "Warning", "line": 24, "patternId": "return_arrow_whitespace"}
//#Issue: {"severity": "Warning", "line": 27, "patternId": "return_arrow_whitespace"}
//#Issue: {"severity": "Warning", "line": 30, "patternId": "return_arrow_whitespace"}
//#Issue: {"severity": "Warning", "line": 33, "patternId": "return_arrow_whitespace"}

    func abc()->Int {}


    func abc()->[Int] {}


    func abc()->(Int, Int) {}


    func abc()-> Int {}


    func abc() ->Int {}


    func abc()  ->  Int {}


    var abc = {(param: Int) ->Bool in }


    var abc = {(param: Int)->Bool in }
