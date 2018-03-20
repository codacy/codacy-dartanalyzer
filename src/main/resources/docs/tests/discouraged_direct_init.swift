//#Patterns: discouraged_direct_init

//#Issue: {"severity": "Info", "line": 17, "patternId": "discouraged_direct_init"}
//#Issue: {"severity": "Info", "line": 20, "patternId": "discouraged_direct_init"}
//#Issue: {"severity": "Info", "line": 23, "patternId": "discouraged_direct_init"}
//#Issue: {"severity": "Info", "line": 26, "patternId": "discouraged_direct_init"}
//#Issue: {"severity": "Info", "line": 29, "patternId": "discouraged_direct_init"}
//#Issue: {"severity": "Info", "line": 29, "patternId": "discouraged_direct_init"}
//#Issue: {"severity": "Info", "line": 32, "patternId": "discouraged_direct_init"}
//#Issue: {"severity": "Info", "line": 35, "patternId": "discouraged_direct_init"}
//#Issue: {"severity": "Info", "line": 38, "patternId": "discouraged_direct_init"}
//#Issue: {"severity": "Info", "line": 41, "patternId": "discouraged_direct_init"}
//#Issue: {"severity": "Info", "line": 44, "patternId": "discouraged_direct_init"}
//#Issue: {"severity": "Info", "line": 44, "patternId": "discouraged_direct_init"}


UIDevice()


Bundle()


let foo = UIDevice()


let foo = Bundle()


let foo = bar(bundle: Bundle(), device: UIDevice())


UIDevice.init()


Bundle.init()


let foo = UIDevice.init()


let foo = Bundle.init()


let foo = bar(bundle: Bundle.init(), device: UIDevice.init())
