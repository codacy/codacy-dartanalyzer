//#Patterns: trailing_comma

//#Issue: {"severity": "Info", "line": 13, "patternId": "trailing_comma"}
//#Issue: {"severity": "Info", "line": 16, "patternId": "trailing_comma"}
//#Issue: {"severity": "Info", "line": 19, "patternId": "trailing_comma"}
//#Issue: {"severity": "Info", "line": 22, "patternId": "trailing_comma"}
//#Issue: {"severity": "Info", "line": 26, "patternId": "trailing_comma"}
//#Issue: {"severity": "Info", "line": 30, "patternId": "trailing_comma"}
//#Issue: {"severity": "Info", "line": 30, "patternId": "trailing_comma"}
//#Issue: {"severity": "Info", "line": 34, "patternId": "trailing_comma"}
//#Issue: {"severity": "Info", "line": 38, "patternId": "trailing_comma"}

    let foo = [1, 2, 3,]


    let foo = [1, 2, 3, ]


    let foo = [1, 2, 3   ,]


    let foo = [1: 2, 2: 3, ]


    struct Bar {
     let foo = [1: 2, 2: 3, ]
    }


    let foo = [1, 2, 3,] + [4, 5, 6↓,]


    let example = [ 1,
    2,
     // 3,
    ]

    let foo = ["אבג", "αβγ", "🇺🇸",]
