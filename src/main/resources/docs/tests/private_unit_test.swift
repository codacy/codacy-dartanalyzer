//#Patterns: private_unit_test

//#Issue: {"severity": "Info", "line": 8, "patternId": "private_unit_test"}
//#Issue: {"severity": "Info", "line": 17, "patternId": "private_unit_test"}
//#Issue: {"severity": "Info", "line": 23, "patternId": "private_unit_test"}
//#Issue: {"severity": "Info", "line": 29, "patternId": "private_unit_test"}

    private class FooTest: XCTestCase { func test1() {}
     internal func test2() {}
     public func test3() {}
     private func test4() {}
     }

    class FooTest: XCTestCase { func test1() {}
     internal func test2() {}
     public func test3() {}
     private func test4() {}
     }

    internal class FooTest: XCTestCase { func test1() {}
     internal func test2() {}
     public func test3() {}
     private func test4() {}
     }

    public class FooTest: XCTestCase { func test1() {}
     internal func test2() {}
     public func test3() {}
     private func test4() {}
     }
