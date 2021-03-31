//#Patterns: fatal_error_message

//#Issue: {"severity": "Warning", "line": 7, "patternId": "fatal_error_message"}
//#Issue: {"severity": "Warning", "line": 12, "patternId": "fatal_error_message"}

    func foo() {
      fatalError("")
    }


    func foo() {
      fatalError()
    }
