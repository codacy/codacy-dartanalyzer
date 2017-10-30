//#Patterns: redundant_discardable_let

    let _ = foo()


    if _ = foo() { let _ = bar() }
