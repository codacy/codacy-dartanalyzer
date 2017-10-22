//#Patterns: explicit_init

    [1].flatMap{String.init($0)}

    [String.self].map { Type in Type.init(1) }
