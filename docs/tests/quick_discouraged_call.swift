//#Patterns: quick_discouraged_call

//#Issue: {"severity": "Warning", "line": 30, "patternId": "quick_discouraged_call"}
//#Issue: {"severity": "Warning", "line": 40, "patternId": "quick_discouraged_call"}
//#Issue: {"severity": "Warning", "line": 51, "patternId": "quick_discouraged_call"}
//#Issue: {"severity": "Warning", "line": 54, "patternId": "quick_discouraged_call"}
//#Issue: {"severity": "Warning", "line": 55, "patternId": "quick_discouraged_call"}
//#Issue: {"severity": "Warning", "line": 79, "patternId": "quick_discouraged_call"}
//#Issue: {"severity": "Warning", "line": 92, "patternId": "quick_discouraged_call"}
//#Issue: {"severity": "Warning", "line": 102, "patternId": "quick_discouraged_call"}
//#Issue: {"severity": "Warning", "line": 112, "patternId": "quick_discouraged_call"}
//#Issue: {"severity": "Warning", "line": 122, "patternId": "quick_discouraged_call"}
//#Issue: {"severity": "Warning", "line": 132, "patternId": "quick_discouraged_call"}
//#Issue: {"severity": "Warning", "line": 142, "patternId": "quick_discouraged_call"}
//#Issue: {"severity": "Warning", "line": 145, "patternId": "quick_discouraged_call"}
//#Issue: {"severity": "Warning", "line": 155, "patternId": "quick_discouraged_call"}
//#Issue: {"severity": "Warning", "line": 158, "patternId": "quick_discouraged_call"}


class TotoTests {
    override func spec() {
        describe("foo") {
            let foo = Foo()
        }
    }
}
class TotoTests: QuickSpec {
    override func spec() {
        describe("foo") {
            let foo = Foo()
        }
    }
}



class TotoTests: QuickSpec {
    override func spec() {
        describe("foo") {
            let foo = Foo()
        }
    }
}



class TotoTests: QuickSpec {
    override func spec() {
        describe("foo") {
            context("foo") {
                let foo = Foo()
            }
            context("bar") {
                let foo = Foo()
                foo.bar()
                it("does something") {
                    let foo = Foo()
                    foo.toto()
                }
            }
        }
    }
}



class TotoTests: QuickSpec {
    override func spec() {
        describe("foo") {
            context("foo") {
                context("foo") {
                    beforeEach {
                        let foo = Foo()
                        foo.toto()
                    }
                    it("bar") {
                    }
                    context("foo") {
                        let foo = Foo()
                    }
                }
            }
        }
    }
}



class TotoTests: QuickSpec {
    override func spec() {
        context("foo") {
            let foo = Foo()
        }
    }
}



class TotoTests: QuickSpec {
    override func spec() {
        sharedExamples("foo") {
            let foo = Foo()
        }
    }
}



class TotoTests: QuickSpec {
    override func spec() {
        describe("foo") {
            foo()
        }
    }
}



class TotoTests: QuickSpec {
    override func spec() {
        context("foo") {
            foo()
        }
    }
}



class TotoTests: QuickSpec {
    override func spec() {
        sharedExamples("foo") {
            foo()
        }
    }
}



class TotoTests: QuickSpec {
    override func spec() {
        xdescribe("foo") {
            let foo = Foo()
        }
        fdescribe("foo") {
            let foo = Foo()
        }
    }
}



class TotoTests: QuickSpec {
    override func spec() {
        xcontext("foo") {
            let foo = Foo()
        }
        fcontext("foo") {
            let foo = Foo()
        }
    }
}
