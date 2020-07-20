//#Patterns: no_grouping_extension

//#Issue: {"severity": "Info", "line": 11, "patternId": "no_grouping_extension"}
//#Issue: {"severity": "Info", "line": 15, "patternId": "no_grouping_extension"}
//#Issue: {"severity": "Info", "line": 21, "patternId": "no_grouping_extension"}
//#Issue: {"severity": "Info", "line": 26, "patternId": "no_grouping_extension"}



enum Fruit {}
extension Fruit {}



extension Tea: Error {}
struct Tea {}



class Ham { class Spam {}}
extension Ham.Spam {}



extension External { struct Gotcha {}}
extension External.Gotcha {}
