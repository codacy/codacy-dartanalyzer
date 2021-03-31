//#Patterns: is_disjoint

//#Issue: {"severity": "Warning", "line": 8, "patternId": "is_disjoint"}
//#Issue: {"severity": "Warning", "line": 11, "patternId": "is_disjoint"}



_ = Set(syntaxKinds).intersection(commentAndStringKindsSet).isEmpty


let isObjc = !objcAttributes.intersection(dictionary.enclosedSwiftAttributes).isEmpty
