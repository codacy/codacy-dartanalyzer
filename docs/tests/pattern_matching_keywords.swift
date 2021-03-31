//#Patterns: pattern_matching_keywords

//#Issue: {"severity": "Warning", "line": 11, "patternId": "pattern_matching_keywords"}
//#Issue: {"severity": "Warning", "line": 16, "patternId": "pattern_matching_keywords"}
//#Issue: {"severity": "Warning", "line": 21, "patternId": "pattern_matching_keywords"}
//#Issue: {"severity": "Warning", "line": 26, "patternId": "pattern_matching_keywords"}
//#Issue: {"severity": "Warning", "line": 31, "patternId": "pattern_matching_keywords"}
//#Issue: {"severity": "Warning", "line": 36, "patternId": "pattern_matching_keywords"}

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
