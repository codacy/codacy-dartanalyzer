//#Patterns: unused_optional_binding

//#Issue: {"severity": "Info", "line": 13, "patternId": "unused_optional_binding"}
//#Issue: {"severity": "Info", "line": 17, "patternId": "unused_optional_binding"}
//#Issue: {"severity": "Info", "line": 21, "patternId": "unused_optional_binding"}
//#Issue: {"severity": "Info", "line": 25, "patternId": "unused_optional_binding"}
//#Issue: {"severity": "Info", "line": 29, "patternId": "unused_optional_binding"}
//#Issue: {"severity": "Info", "line": 33, "patternId": "unused_optional_binding"}
//#Issue: {"severity": "Info", "line": 37, "patternId": "unused_optional_binding"}
//#Issue: {"severity": "Info", "line": 42, "patternId": "unused_optional_binding"}
//#Issue: {"severity": "Info", "line": 46, "patternId": "unused_optional_binding"}

    if let _ = Foo.optionalValue {
    }


    if let a = Foo.optionalValue, let _ = Foo.optionalValue2 {
    }


    guard let a = Foo.optionalValue, let _ = Foo.optionalValue2 {
    }


    if let (first, second) = getOptionalTuple(), let _ = Foo.optionalValue {
    }


    if let (first, _) = getOptionalTuple(), let _ = Foo.optionalValue {
    }


    if let (_, second) = getOptionalTuple(), let _ = Foo.optionalValue {
    }


    if let (_, _, _) = getOptionalTuple(), let bar = Foo.optionalValue {
    }


    func foo() {
    if let _ = bar {
    }


    if case .some(let _) = self {}
