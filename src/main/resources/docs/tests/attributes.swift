//#Patterns: attributes

//#Issue: {"severity": "Info", "line": 37, "patternId": "attributes"}
//#Issue: {"severity": "Info", "line": 41, "patternId": "attributes"}
//#Issue: {"severity": "Info", "line": 44, "patternId": "attributes"}
//#Issue: {"severity": "Info", "line": 47, "patternId": "attributes"}
//#Issue: {"severity": "Info", "line": 50, "patternId": "attributes"}
//#Issue: {"severity": "Info", "line": 54, "patternId": "attributes"}
//#Issue: {"severity": "Info", "line": 57, "patternId": "attributes"}
//#Issue: {"severity": "Info", "line": 60, "patternId": "attributes"}
//#Issue: {"severity": "Info", "line": 63, "patternId": "attributes"}
//#Issue: {"severity": "Info", "line": 65, "patternId": "attributes"}
//#Issue: {"severity": "Info", "line": 68, "patternId": "attributes"}
//#Issue: {"severity": "Info", "line": 71, "patternId": "attributes"}
//#Issue: {"severity": "Info", "line": 75, "patternId": "attributes"}
//#Issue: {"severity": "Info", "line": 77, "patternId": "attributes"}
//#Issue: {"severity": "Info", "line": 79, "patternId": "attributes"}
//#Issue: {"severity": "Info", "line": 81, "patternId": "attributes"}
//#Issue: {"severity": "Info", "line": 84, "patternId": "attributes"}
//#Issue: {"severity": "Info", "line": 87, "patternId": "attributes"}
//#Issue: {"severity": "Info", "line": 91, "patternId": "attributes"}
//#Issue: {"severity": "Info", "line": 93, "patternId": "attributes"}
//#Issue: {"severity": "Info", "line": 95, "patternId": "attributes"}
//#Issue: {"severity": "Info", "line": 98, "patternId": "attributes"}
//#Issue: {"severity": "Info", "line": 103, "patternId": "attributes"}
//#Issue: {"severity": "Info", "line": 105, "patternId": "attributes"}
//#Issue: {"severity": "Info", "line": 108, "patternId": "attributes"}
//#Issue: {"severity": "Info", "line": 111, "patternId": "attributes"}
//#Issue: {"severity": "Info", "line": 115, "patternId": "attributes"}
//#Issue: {"severity": "Info", "line": 118, "patternId": "attributes"}
//#Issue: {"severity": "Info", "line": 121, "patternId": "attributes"}
//#Issue: {"severity": "Info", "line": 123, "patternId": "attributes"}
//#Issue: {"severity": "Info", "line": 126, "patternId": "attributes"}
//#Issue: {"severity": "Info", "line": 131, "patternId": "attributes"}

    @objc
     var x: String

    @objc

     var x: String

    @objc
     private var x: String

    @nonobjc
     var x: String

    @IBOutlet
     private var label: UILabel

    @IBOutlet

     private var label: UILabel

    @NSCopying
     var name: NSString

    @NSManaged
     var name: String?

    @IBInspectable
     var cornerRadius: CGFloat

    @available(iOS 9.0, *) let stackView: UIStackView

    @NSManaged
     func addSomeObject(book: SomeObject)

    @IBAction
     func buttonPressed(button: UIButton)

    @IBAction
     @objc
     func buttonPressed(button: UIButton)

    @available(iOS 9.0, *) func animate(view: UIStackView)

    @nonobjc final class X

    @available(iOS 9.0, *) class UIStackView

    @available(iOS 9.0, *)
     @objc class UIStackView

    @available(iOS 9.0, *) @objc
     class UIStackView

    @available(iOS 9.0, *)

     class UIStackView

    @UIApplicationMain class AppDelegate: NSObject, UIApplicationDelegate

    @IBDesignable class MyCustomView: UIView

    @testable
    import SourceKittenFramework

    @testable


    import SourceKittenFramework

    @objc(foo_x) var x: String

    @available(iOS 9.0, *) @objc(abc_stackView)
     let stackView: UIStackView

    @objc(abc_addSomeObject:) @NSManaged
     func addSomeObject(book: SomeObject)

    @objc(abc_addSomeObject:)
     @NSManaged
     func addSomeObject(book: SomeObject)

    @available(iOS 9.0, *)
     @objc(ABCThing) class Thing

    @GKInspectable
     var maxSpeed: Float

    @discardableResult func a() -> Int

    @objc
     @discardableResult func a() -> Int

    @objc

     @discardableResult
     func a() -> Int
