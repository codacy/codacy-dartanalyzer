//#Patterns: multiline_arguments

//#Issue: {"severity": "Info", "line": 15, "patternId": "multiline_arguments"}
//#Issue: {"severity": "Info", "line": 15, "patternId": "multiline_arguments"}
//#Issue: {"severity": "Info", "line": 18, "patternId": "multiline_arguments"}
//#Issue: {"severity": "Info", "line": 19, "patternId": "multiline_arguments"}
//#Issue: {"severity": "Info", "line": 22, "patternId": "multiline_arguments"}
//#Issue: {"severity": "Info", "line": 22, "patternId": "multiline_arguments"}
//#Issue: {"severity": "Info", "line": 27, "patternId": "multiline_arguments"}
//#Issue: {"severity": "Info", "line": 28, "patternId": "multiline_arguments"}



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
