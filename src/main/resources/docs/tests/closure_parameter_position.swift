//#Patterns: closure_parameter_position

//#Issue: {"severity": "Info", "line": 12, "patternId": "closure_parameter_position"}
//#Issue: {"severity": "Info", "line": 18, "patternId": "closure_parameter_position"}
//#Issue: {"severity": "Info", "line": 24, "patternId": "closure_parameter_position"}
//#Issue: {"severity": "Info", "line": 30, "patternId": "closure_parameter_position"}
//#Issue: {"severity": "Info", "line": 36, "patternId": "closure_parameter_position"}
//#Issue: {"severity": "Info", "line": 42, "patternId": "closure_parameter_position"}
//#Issue: {"severity": "Info", "line": 48, "patternId": "closure_parameter_position"}

    [1, 2].map {
     number in
     number + 1
    }


    [1, 2].map {
     number -> Int in
     number + 1
    }


    [1, 2].map {
     (number: Int) -> Int in
     number + 1
    }


    [1, 2].map {
     [weak self] number in
     number + 1
    }


    [1, 2].map { [weak self]
     number in
     number + 1
    }


    [1, 2].map({
     number in
     number + 1
    })


    [1, 2].something(closure: {
     number in
     number + 1
    })


    [1, 2].reduce(0) {
     sum, ↓number in
     number + sum
    }
