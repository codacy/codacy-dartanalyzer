class ParseMachineFormatTest extends FunSuite {

    /*
    * https://github.com/dart-lang/sdk/blob/main/pkg/analyzer_cli/lib/src/error_formatter.dart
    */
    test("parse a machine format output from dartanalyzer") {
        
        val output = "INFO|HINT|UNUSED_LOCAL_VARIABLE|/Users/rubensantos/Codacy/Repos/codacy-dartanalyzer/docs/multiple-tests/no-patterns/src/test.dart|2|7|9|The value of the local variable 'unusedVar' isn't used."

        val parsed = output.split('|')
        
        parsed[0]

    }
  
}
