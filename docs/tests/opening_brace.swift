//#Patterns: opening_brace

//#Issue: {"severity": "Warning", "line": 18, "patternId": "opening_brace"}
//#Issue: {"severity": "Warning", "line": 22, "patternId": "opening_brace"}
//#Issue: {"severity": "Warning", "line": 24, "patternId": "opening_brace"}
//#Issue: {"severity": "Warning", "line": 26, "patternId": "opening_brace"}
//#Issue: {"severity": "Warning", "line": 28, "patternId": "opening_brace"}
//#Issue: {"severity": "Warning", "line": 30, "patternId": "opening_brace"}
//#Issue: {"severity": "Warning", "line": 32, "patternId": "opening_brace"}
//#Issue: {"severity": "Warning", "line": 37, "patternId": "opening_brace"}
//#Issue: {"severity": "Warning", "line": 42, "patternId": "opening_brace"}
//#Issue: {"severity": "Warning", "line": 47, "patternId": "opening_brace"}
//#Issue: {"severity": "Warning", "line": 49, "patternId": "opening_brace"}
//#Issue: {"severity": "Warning", "line": 53, "patternId": "opening_brace"}
//#Issue: {"severity": "Warning", "line": 59, "patternId": "opening_brace"}
//#Issue: {"severity": "Warning", "line": 65, "patternId": "opening_brace"}

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
