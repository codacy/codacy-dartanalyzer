//#Patterns: quick_discouraged_focused_test

//#Issue: {"severity": "Warning", "line": 13, "patternId": "quick_discouraged_focused_test"}
//#Issue: {"severity": "Warning", "line": 20, "patternId": "quick_discouraged_focused_test"}
//#Issue: {"severity": "Warning", "line": 27, "patternId": "quick_discouraged_focused_test"}
//#Issue: {"severity": "Warning", "line": 35, "patternId": "quick_discouraged_focused_test"}
//#Issue: {"severity": "Warning", "line": 44, "patternId": "quick_discouraged_focused_test"}
//#Issue: {"severity": "Warning", "line": 54, "patternId": "quick_discouraged_focused_test"}
//#Issue: {"severity": "Warning", "line": 63, "patternId": "quick_discouraged_focused_test"}

class TotoTests: QuickSpec {
    override func spec() {
        fdescribe("foo") { }
    }
}


class TotoTests: QuickSpec {
    override func spec() {
        fcontext("foo") { }
    }
}


class TotoTests: QuickSpec {
    override func spec() {
        fit("foo") { }
    }
}


class TotoTests: QuickSpec {
    override func spec() {
        describe("foo") {
            fit("bar") { }
        }
    }
}


class TotoTests: QuickSpec {
    override func spec() {
        context("foo") {
            fit("bar") { }
        }
    }
}


class TotoTests: QuickSpec {
    override func spec() {
        describe("foo") {
            context("bar") {
                fit("toto") { }
            }
        }
    }
}


class TotoTests: QuickSpec {
    override func spec() {
        fitBehavesLike("foo")
    }
}
