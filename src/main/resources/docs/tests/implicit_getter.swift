//#Patterns: implicit_getter

//#Issue: {"severity": "Info", "line": 11, "patternId": "implicit_getter"}
//#Issue: {"severity": "Info", "line": 21, "patternId": "implicit_getter"}
//#Issue: {"severity": "Info", "line": 31, "patternId": "implicit_getter"}
//#Issue: {"severity": "Info", "line": 40, "patternId": "implicit_getter"}
//#Issue: {"severity": "Info", "line": 49, "patternId": "implicit_getter"}

    class Foo {
      var foo: Int {
     get {
     return 20
    }
    }
    }
    }


    class Foo {
      var foo: Int {
     get{
     return 20
    }
    }
    }
    }


    class Foo {
      static var foo: Int {
     get {
     return 20
    }
    }
    }
    }


    var foo: Int {
     get {
     return 20
    }
    }
    }

    class Foo {
      @objc func bar() { }
    var foo: Int {
     get {
     return 20
    }
    }
    }
    }
