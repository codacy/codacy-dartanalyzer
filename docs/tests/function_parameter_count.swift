//#Patterns: function_parameter_count

//#Issue: {"severity": "Info", "line": 8, "patternId": "function_parameter_count"}
//#Issue: {"severity": "Info", "line": 10, "patternId": "function_parameter_count"}
//#Issue: {"severity": "Info", "line": 12, "patternId": "function_parameter_count"}
//#Issue: {"severity": "Info", "line": 16, "patternId": "function_parameter_count"}

    func f(a: Int, b: Int, c: Int, d: Int, e: Int, f: Int) {}

    func initialValue(a: Int, b: Int, c: Int, d: Int, e: Int, f: Int) {}

    func f(a: Int, b: Int, c: Int, d: Int, e: Int, f: Int = 2, g: Int) {}

    struct Foo {
    init(a: Int, b: Int, c: Int, d: Int, e: Int, f: Int) {}
    func bar(a: Int, b: Int, c: Int, d: Int, e: Int, f: Int) {}}
