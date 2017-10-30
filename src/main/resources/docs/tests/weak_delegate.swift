//#Patterns: weak_delegate

//#Issue: {"severity": "Info", "line": 14, "patternId": "weak_delegate"}
//#Issue: {"severity": "Info", "line": 14, "patternId": "weak_delegate"}

    class Foo {
      var delegate: SomeProtocol?
    }


    class Foo {
      var scrollDelegate: ScrollDelegate?
    }
