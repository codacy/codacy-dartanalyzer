//#Patterns: xctfail_message

//#Issue: {"severity": "Warning", "line": 8, "patternId": "xctfail_message"}
//#Issue: {"severity": "Warning", "line": 13, "patternId": "xctfail_message"}


func testFoo() {
    XCTFail()
}


func testFoo() {
    XCTFail("")
}
