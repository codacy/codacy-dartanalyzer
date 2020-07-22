//#Patterns: multiline_arguments

//#Issue: {"severity": "Info", "line": 13, "patternId": "multiline_arguments"}
//#Issue: {"severity": "Info", "line": 16, "patternId": "multiline_arguments"}
//#Issue: {"severity": "Info", "line": 17, "patternId": "multiline_arguments"}
//#Issue: {"severity": "Info", "line": 20, "patternId": "multiline_arguments"}
//#Issue: {"severity": "Info", "line": 25, "patternId": "multiline_arguments"}
//#Issue: {"severity": "Info", "line": 26, "patternId": "multiline_arguments"}



foo(0,
    param1: 1, param2: true, ↓param3: [3])


foo(0, param1: 1,
    param2: true, param3: [3])


foo(0, param1: 1, ↓param2: true,
    param3: [3])


foo(
    0, param1: 1,
    param2: true, param3: [3]
)
