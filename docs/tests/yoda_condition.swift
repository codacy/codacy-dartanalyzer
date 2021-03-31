//#Patterns: yoda_condition

//#Issue: {"severity": "Warning", "line": 12, "patternId": "yoda_condition"}
//#Issue: {"severity": "Warning", "line": 16, "patternId": "yoda_condition"}
//#Issue: {"severity": "Warning", "line": 20, "patternId": "yoda_condition"}
//#Issue: {"severity": "Warning", "line": 24, "patternId": "yoda_condition"}
//#Issue: {"severity": "Warning", "line": 27, "patternId": "yoda_condition"}
//#Issue: {"severity": "Warning", "line": 30, "patternId": "yoda_condition"}
//#Issue: {"severity": "Warning", "line": 33, "patternId": "yoda_condition"}


if 42 == foo {}



if 42.42 >= foo {}



guard 42 <= foo else { return }



guard "str str" != foo else { return }


while 10 > foo { }


while 1 < foo { }


if nil == foo
