//#Patterns: generic_type_name

//#Issue: {"severity": "Info", "line": 29, "patternId": "generic_type_name"}
//#Issue: {"severity": "Info", "line": 32, "patternId": "generic_type_name"}
//#Issue: {"severity": "Info", "line": 35, "patternId": "generic_type_name"}
//#Issue: {"severity": "Info", "line": 38, "patternId": "generic_type_name"}
//#Issue: {"severity": "Info", "line": 41, "patternId": "generic_type_name"}
//#Issue: {"severity": "Info", "line": 44, "patternId": "generic_type_name"}
//#Issue: {"severity": "Info", "line": 47, "patternId": "generic_type_name"}
//#Issue: {"severity": "Info", "line": 50, "patternId": "generic_type_name"}
//#Issue: {"severity": "Info", "line": 53, "patternId": "generic_type_name"}
//#Issue: {"severity": "Info", "line": 56, "patternId": "generic_type_name"}
//#Issue: {"severity": "Info", "line": 56, "patternId": "generic_type_name"}
//#Issue: {"severity": "Info", "line": 59, "patternId": "generic_type_name"}
//#Issue: {"severity": "Info", "line": 62, "patternId": "generic_type_name"}
//#Issue: {"severity": "Info", "line": 65, "patternId": "generic_type_name"}
//#Issue: {"severity": "Info", "line": 68, "patternId": "generic_type_name"}
//#Issue: {"severity": "Info", "line": 71, "patternId": "generic_type_name"}
//#Issue: {"severity": "Info", "line": 71, "patternId": "generic_type_name"}
//#Issue: {"severity": "Info", "line": 74, "patternId": "generic_type_name"}
//#Issue: {"severity": "Info", "line": 77, "patternId": "generic_type_name"}
//#Issue: {"severity": "Info", "line": 80, "patternId": "generic_type_name"}
//#Issue: {"severity": "Info", "line": 83, "patternId": "generic_type_name"}
//#Issue: {"severity": "Info", "line": 86, "patternId": "generic_type_name"}
//#Issue: {"severity": "Info", "line": 86, "patternId": "generic_type_name"}
//#Issue: {"severity": "Info", "line": 89, "patternId": "generic_type_name"}
//#Issue: {"severity": "Info", "line": 92, "patternId": "generic_type_name"}

    func foo<T_Foo>() {}


    func foo<T, U_Foo>(param: U_Foo) -> T {}


    func foo<TTTTTTTTTTTTTTTTTTTTT>() {}


    func foo<type>() {}


    typealias StringDictionary<T_Foo> = Dictionary<String, T_Foo>


    typealias BackwardTriple<T1, T2_Bar, T3> = (T3, T2_Bar, T1)


    typealias DictionaryOfStrings<T_Foo: Hashable> = Dictionary<T, String>


    class Foo<T_Foo> {}


    class Foo<T, U_Foo> {}


    class Foo<T_Foo, ↓U_Foo> {}


    class Foo<TTTTTTTTTTTTTTTTTTTTT> {}


    class Foo<type> {}


    struct Foo<T_Foo> {}


    struct Foo<T, U_Foo> {}


    struct Foo<T_Foo, ↓U_Foo> {}


    struct Foo<TTTTTTTTTTTTTTTTTTTTT> {}


    struct Foo<type> {}


    enum Foo<T_Foo> {}


    enum Foo<T, U_Foo> {}


    enum Foo<T_Foo, ↓U_Foo> {}


    enum Foo<TTTTTTTTTTTTTTTTTTTTT> {}


    enum Foo<type> {}
