//#Patterns: implicit_return

//#Issue: {"severity": "Info", "line": 7, "patternId": "implicit_return"}
//#Issue: {"severity": "Info", "line": 11, "patternId": "implicit_return"}

    foo.map { value in
      return value + 1
    }

    foo.map {
      return $0 + 1
    }
