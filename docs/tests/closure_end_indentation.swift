//#Patterns: closure_end_indentation

//#Issue: {"severity": "Info", "line": 10, "patternId": "closure_end_indentation"}
//#Issue: {"severity": "Info", "line": 15, "patternId": "closure_end_indentation"}
//#Issue: {"severity": "Info", "line": 17, "patternId": "closure_end_indentation"}

    SignalProducer(values: [1, 2, 3])
       .startWithNext { number in
           print(number)
    }


    return match(pattern: pattern, with: [.comment]).flatMap { range in
       return Command(string: contents, range: range)
       }.flatMap { command in
       return command.expand()
    }
