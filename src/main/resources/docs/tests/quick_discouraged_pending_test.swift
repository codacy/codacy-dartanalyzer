//#Patterns: quick_discouraged_pending_test

//#Issue: {"severity": "Info", "line": 15, "patternId": "quick_discouraged_pending_test"}
//#Issue: {"severity": "Info", "line": 23, "patternId": "quick_discouraged_pending_test"}
//#Issue: {"severity": "Info", "line": 31, "patternId": "quick_discouraged_pending_test"}
//#Issue: {"severity": "Info", "line": 40, "patternId": "quick_discouraged_pending_test"}
//#Issue: {"severity": "Info", "line": 50, "patternId": "quick_discouraged_pending_test"}
//#Issue: {"severity": "Info", "line": 61, "patternId": "quick_discouraged_pending_test"}
//#Issue: {"severity": "Info", "line": 71, "patternId": "quick_discouraged_pending_test"}
//#Issue: {"severity": "Info", "line": 79, "patternId": "quick_discouraged_pending_test"}


class TotoTests: QuickSpec {
    override func spec() {
        xdescribe("foo") { }
    }
}



class TotoTests: QuickSpec {
    override func spec() {
        xcontext("foo") { }
    }
}



class TotoTests: QuickSpec {
    override func spec() {
        xit("foo") { }
    }
}



class TotoTests: QuickSpec {
    override func spec() {
        describe("foo") {
            xit("bar") { }
        }
    }
}



class TotoTests: QuickSpec {
    override func spec() {
        context("foo") {
            xit("bar") { }
        }
    }
}



class TotoTests: QuickSpec {
    override func spec() {
        describe("foo") {
            context("bar") {
                xit("toto") { }
            }
        }
    }
}



class TotoTests: QuickSpec {
    override func spec() {
        pending("foo")
    }
}



class TotoTests: QuickSpec {
    override func spec() {
        xitBehavesLike("foo")
    }
}
