//#Patterns: opening_brace

//#Issue: {"severity": "Info", "line": 18, "patternId": "opening_brace"}
//#Issue: {"severity": "Info", "line": 22, "patternId": "opening_brace"}
//#Issue: {"severity": "Info", "line": 24, "patternId": "opening_brace"}
//#Issue: {"severity": "Info", "line": 26, "patternId": "opening_brace"}
//#Issue: {"severity": "Info", "line": 28, "patternId": "opening_brace"}
//#Issue: {"severity": "Info", "line": 30, "patternId": "opening_brace"}
//#Issue: {"severity": "Info", "line": 32, "patternId": "opening_brace"}
//#Issue: {"severity": "Info", "line": 37, "patternId": "opening_brace"}
//#Issue: {"severity": "Info", "line": 42, "patternId": "opening_brace"}
//#Issue: {"severity": "Info", "line": 47, "patternId": "opening_brace"}
//#Issue: {"severity": "Info", "line": 49, "patternId": "opening_brace"}
//#Issue: {"severity": "Info", "line": 53, "patternId": "opening_brace"}
//#Issue: {"severity": "Info", "line": 59, "patternId": "opening_brace"}
//#Issue: {"severity": "Info", "line": 65, "patternId": "opening_brace"}

    func abc(){
    }

    func abc()
    	{ }

    [].map(){ $0 }

    [].map( { } )

    if let a = b{ }

    while a == b{ }

    guard let a = b else{ }

    if
    	let a = b,
    	let c = d
    	where a == c{ }

    while
    	let a = b,
    	let c = d
    	where a == c{ }

    guard
    	let a = b,
    	let c = d
    	where a == c else{ }

    struct Rule{}


    struct Rule
    {
    }


    struct Rule

    	{
    }


    struct Parent {
    	struct Child
    	{
    		let foo: Int
    	}
    }
