//#Patterns: unused_enumerated

//#Issue: {"severity": "Info", "line": 8, "patternId": "unused_enumerated"}
//#Issue: {"severity": "Info", "line": 11, "patternId": "unused_enumerated"}
//#Issue: {"severity": "Info", "line": 14, "patternId": "unused_enumerated"}
//#Issue: {"severity": "Info", "line": 17, "patternId": "unused_enumerated"}

    for (_, foo) in bar.enumerated() { }


    for (_, foo) in abc.bar.enumerated() { }


    for (_, foo) in abc.something().enumerated() { }


    for (idx, _) in bar.enumerated() { }
