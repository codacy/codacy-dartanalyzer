//#Patterns: private_action

//#Issue: {"severity": "Info", "line": 17, "patternId": "private_action"}
//#Issue: {"severity": "Info", "line": 23, "patternId": "private_action"}
//#Issue: {"severity": "Info", "line": 29, "patternId": "private_action"}
//#Issue: {"severity": "Info", "line": 35, "patternId": "private_action"}
//#Issue: {"severity": "Info", "line": 41, "patternId": "private_action"}
//#Issue: {"severity": "Info", "line": 47, "patternId": "private_action"}
//#Issue: {"severity": "Info", "line": 53, "patternId": "private_action"}
//#Issue: {"severity": "Info", "line": 59, "patternId": "private_action"}
//#Issue: {"severity": "Info", "line": 65, "patternId": "private_action"}
//#Issue: {"severity": "Info", "line": 71, "patternId": "private_action"}
//#Issue: {"severity": "Info", "line": 77, "patternId": "private_action"}


class Foo {
    @IBAction func barButtonTapped(_ sender: UIButton) {}
}



struct Foo {
    @IBAction func barButtonTapped(_ sender: UIButton) {}
}



class Foo {
    @IBAction public func barButtonTapped(_ sender: UIButton) {}
}



struct Foo {
    @IBAction public func barButtonTapped(_ sender: UIButton) {}
}



class Foo {
    @IBAction internal func barButtonTapped(_ sender: UIButton) {}
}



struct Foo {
    @IBAction internal func barButtonTapped(_ sender: UIButton) {}
}



extension Foo {
    @IBAction func barButtonTapped(_ sender: UIButton) {}
}



extension Foo {
    @IBAction public func barButtonTapped(_ sender: UIButton) {}
}



extension Foo {
    @IBAction internal func barButtonTapped(_ sender: UIButton) {}
}



public extension Foo {
    @IBAction func barButtonTapped(_ sender: UIButton) {}
}



internal extension Foo {
    @IBAction func barButtonTapped(_ sender: UIButton) {}
}
