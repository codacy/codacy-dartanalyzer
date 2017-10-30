//#Patterns: generic_type_name

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
