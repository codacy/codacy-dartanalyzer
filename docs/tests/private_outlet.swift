//#Patterns: private_outlet

//#Issue: {"severity": "Info", "line": 7, "patternId": "private_outlet"}
//#Issue: {"severity": "Info", "line": 12, "patternId": "private_outlet"}

    class Foo {
      @IBOutlet var label: UILabel?
    }


    class Foo {
      @IBOutlet var label: UILabel!
    }
