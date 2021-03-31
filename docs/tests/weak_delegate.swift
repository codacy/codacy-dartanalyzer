//#Patterns: weak_delegate

//#Issue: {"severity": "Warning", "line": 7, "patternId": "weak_delegate"}
//#Issue: {"severity": "Warning", "line": 12, "patternId": "weak_delegate"}

    class Foo {
      var delegate: SomeProtocol?
    }


    class Foo {
      var scrollDelegate: ScrollDelegate?
    }
