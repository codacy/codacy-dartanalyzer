//#Patterns: dynamic_inline

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
