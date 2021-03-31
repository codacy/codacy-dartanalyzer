//#Patterns: extension_access_modifier

//#Issue: {"severity": "Warning", "line": 8, "patternId": "extension_access_modifier"}
//#Issue: {"severity": "Warning", "line": 13, "patternId": "extension_access_modifier"}
//#Issue: {"severity": "Warning", "line": 19, "patternId": "extension_access_modifier"}
//#Issue: {"severity": "Warning", "line": 20, "patternId": "extension_access_modifier"}

    extension Foo {
       public var bar: Int { return 1 }
       public var baz: Int { return 1 }
    }

    extension Foo {
       public var bar: Int { return 1 }
       public func baz() {}
    }

    public extension Foo {
       public func bar() {}
       public func baz() {}
    }
