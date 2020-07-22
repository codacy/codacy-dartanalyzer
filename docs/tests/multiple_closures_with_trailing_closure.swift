//#Patterns: multiple_closures_with_trailing_closure

//#Issue: {"severity": "Info", "line": 8, "patternId": "multiple_closures_with_trailing_closure"}
//#Issue: {"severity": "Info", "line": 13, "patternId": "multiple_closures_with_trailing_closure"}



foo.something(param1: { $0 }) { $0 + 1 }


UIView.animate(withDuration: 1.0, animations: {
    someView.alpha = 0.0
}) { _ in
    someView.removeFromSuperview()
}
