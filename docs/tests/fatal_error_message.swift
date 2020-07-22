//#Patterns: fatal_error_message

//#Issue: {"severity": "Info", "line": 7, "patternId": "fatal_error_message"}
//#Issue: {"severity": "Info", "line": 12, "patternId": "fatal_error_message"}

    func foo() {
      fatalError("")
    }


    func foo() {
      fatalError()
    }
