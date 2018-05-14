//#Patterns: pattern_matching_keywords

//#Issue: {"severity": "Info", "line": 17, "patternId": "pattern_matching_keywords"}
//#Issue: {"severity": "Info", "line": 17, "patternId": "pattern_matching_keywords"}
//#Issue: {"severity": "Info", "line": 22, "patternId": "pattern_matching_keywords"}
//#Issue: {"severity": "Info", "line": 22, "patternId": "pattern_matching_keywords"}
//#Issue: {"severity": "Info", "line": 27, "patternId": "pattern_matching_keywords"}
//#Issue: {"severity": "Info", "line": 27, "patternId": "pattern_matching_keywords"}
//#Issue: {"severity": "Info", "line": 32, "patternId": "pattern_matching_keywords"}
//#Issue: {"severity": "Info", "line": 32, "patternId": "pattern_matching_keywords"}
//#Issue: {"severity": "Info", "line": 37, "patternId": "pattern_matching_keywords"}
//#Issue: {"severity": "Info", "line": 37, "patternId": "pattern_matching_keywords"}
//#Issue: {"severity": "Info", "line": 42, "patternId": "pattern_matching_keywords"}
//#Issue: {"severity": "Info", "line": 42, "patternId": "pattern_matching_keywords"}

switch foo {
case (let x,  let y): break
}


switch foo {
case .foo(let x, let y): break
}


switch foo {
case (.yamlParsing(let x), .yamlParsing(let y)): break
}


switch foo {
case (var x,  var y): break
}


switch foo {
case .foo(var x, var y): break
}


switch foo {
case (.yamlParsing(var x), .yamlParsing(var y)): break
}
