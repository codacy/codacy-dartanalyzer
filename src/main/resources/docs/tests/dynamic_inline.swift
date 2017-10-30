//#Patterns: dynamic_inline

//#Issue: {"severity": "Info", "line": 10, "patternId": "dynamic_inline"}
//#Issue: {"severity": "Info", "line": 14, "patternId": "dynamic_inline"}
//#Issue: {"severity": "Info", "line": 18, "patternId": "dynamic_inline"}
//#Issue: {"severity": "Info", "line": 23, "patternId": "dynamic_inline"}
//#Issue: {"severity": "Info", "line": 29, "patternId": "dynamic_inline"}

    class C {
    @inline(__always) dynamic func f() {}
    }

    class C {
    @inline(__always) public dynamic func f() {}
    }

    class C {
    @inline(__always) dynamic internal func f() {}
    }

    class C {
    @inline(__always)
    dynamic func f() {}
    }

    class C {
    @inline(__always)
    dynamic
    func f() {}
    }
