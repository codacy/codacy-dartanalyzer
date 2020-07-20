//#Patterns: return_arrow_whitespace

//#Issue: {"severity": "Info", "line": 12, "patternId": "return_arrow_whitespace"}
//#Issue: {"severity": "Info", "line": 15, "patternId": "return_arrow_whitespace"}
//#Issue: {"severity": "Info", "line": 18, "patternId": "return_arrow_whitespace"}
//#Issue: {"severity": "Info", "line": 21, "patternId": "return_arrow_whitespace"}
//#Issue: {"severity": "Info", "line": 24, "patternId": "return_arrow_whitespace"}
//#Issue: {"severity": "Info", "line": 27, "patternId": "return_arrow_whitespace"}
//#Issue: {"severity": "Info", "line": 30, "patternId": "return_arrow_whitespace"}
//#Issue: {"severity": "Info", "line": 33, "patternId": "return_arrow_whitespace"}

    func abc()->Int {}


    func abc()->[Int] {}


    func abc()->(Int, Int) {}


    func abc()-> Int {}


    func abc() ->Int {}


    func abc()  ->  Int {}


    var abc = {(param: Int) ->Bool in }


    var abc = {(param: Int)->Bool in }
