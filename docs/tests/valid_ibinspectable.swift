//#Patterns: valid_ibinspectable

//#Issue: {"severity": "Info", "line": 14, "patternId": "valid_ibinspectable"}
//#Issue: {"severity": "Info", "line": 19, "patternId": "valid_ibinspectable"}
//#Issue: {"severity": "Info", "line": 24, "patternId": "valid_ibinspectable"}
//#Issue: {"severity": "Info", "line": 29, "patternId": "valid_ibinspectable"}
//#Issue: {"severity": "Info", "line": 34, "patternId": "valid_ibinspectable"}
//#Issue: {"severity": "Info", "line": 39, "patternId": "valid_ibinspectable"}
//#Issue: {"severity": "Info", "line": 44, "patternId": "valid_ibinspectable"}
//#Issue: {"severity": "Info", "line": 49, "patternId": "valid_ibinspectable"}
//#Issue: {"severity": "Info", "line": 54, "patternId": "valid_ibinspectable"}

    class Foo {
      @IBInspectable private let count: Int
    }


    class Foo {
      @IBInspectable private var insets: UIEdgeInsets
    }


    class Foo {
      @IBInspectable private var count = 0
    }


    class Foo {
      @IBInspectable private var count: Int?
    }


    class Foo {
      @IBInspectable private var count: Int!
    }


    class Foo {
      @IBInspectable private var x: ImplicitlyUnwrappedOptional<Int>
    }


    class Foo {
      @IBInspectable private var count: Optional<Int>
    }


    class Foo {
      @IBInspectable private var x: Optional<String>
    }


    class Foo {
      @IBInspectable private var x: ImplicitlyUnwrappedOptional<String>
    }
