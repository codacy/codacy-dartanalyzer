//#Patterns: no_extension_access_modifier

//#Issue: {"severity": "Info", "line": 9, "patternId": "no_extension_access_modifier"}
//#Issue: {"severity": "Info", "line": 11, "patternId": "no_extension_access_modifier"}
//#Issue: {"severity": "Info", "line": 14, "patternId": "no_extension_access_modifier"}
//#Issue: {"severity": "Info", "line": 16, "patternId": "no_extension_access_modifier"}
//#Issue: {"severity": "Info", "line": 18, "patternId": "no_extension_access_modifier"}

    private extension String {}

    public
     extension String {}

    open extension String {}

    internal extension String {}

    fileprivate extension String {}
    
