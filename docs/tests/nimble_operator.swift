//#Patterns: nimble_operator

//#Issue: {"severity": "Warning", "line": 13, "patternId": "nimble_operator"}
//#Issue: {"severity": "Warning", "line": 16, "patternId": "nimble_operator"}
//#Issue: {"severity": "Warning", "line": 19, "patternId": "nimble_operator"}
//#Issue: {"severity": "Warning", "line": 22, "patternId": "nimble_operator"}
//#Issue: {"severity": "Warning", "line": 25, "patternId": "nimble_operator"}
//#Issue: {"severity": "Warning", "line": 28, "patternId": "nimble_operator"}
//#Issue: {"severity": "Warning", "line": 31, "patternId": "nimble_operator"}
//#Issue: {"severity": "Warning", "line": 34, "patternId": "nimble_operator"}
//#Issue: {"severity": "Warning", "line": 38, "patternId": "nimble_operator"}

    expect(seagull.squawk).toNot(equal("Hi"))


    expect(12).toNot(equal(10))


    expect(10).to(equal(10))


    expect(10).to(beGreaterThan(8))


    expect(10).to(beGreaterThanOrEqualTo(10))


    expect(10).to(beLessThan(11))


    expect(10).to(beLessThanOrEqualTo(10))


    expect(x).to(beIdenticalTo(x))


    expect(10) > 2
     expect(10).to(beGreaterThan(2))
