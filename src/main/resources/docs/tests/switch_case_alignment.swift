//#Patterns: switch_case_alignment

//#Issue: {"severity": "Info", "line": 12, "patternId": "switch_case_alignment"}
//#Issue: {"severity": "Info", "line": 14, "patternId": "switch_case_alignment"}
//#Issue: {"severity": "Info", "line": 20, "patternId": "switch_case_alignment"}
//#Issue: {"severity": "Info", "line": 28, "patternId": "switch_case_alignment"}
//#Issue: {"severity": "Info", "line": 32, "patternId": "switch_case_alignment"}



    switch someBool {
        case true:
             print('red')
        case false:
             print('blue')
    }

    if aBool {
        switch someBool {
            case true:
                print('red')
        case false:
            print('blue')
        }
    }

    switch someInt {
        case 0:
        print('Zero')
    case 1:
        print('One')
        default:
        print('Some other number')
    }
