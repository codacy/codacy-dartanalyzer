//#Patterns: vertical_parameter_alignment

//#Issue: {"severity": "Warning", "line": 9, "patternId": "vertical_parameter_alignment"}
//#Issue: {"severity": "Warning", "line": 13, "patternId": "vertical_parameter_alignment"}
//#Issue: {"severity": "Warning", "line": 17, "patternId": "vertical_parameter_alignment"}
//#Issue: {"severity": "Warning", "line": 18, "patternId": "vertical_parameter_alignment"}

    func validateFunction(_ file: File, kind: SwiftDeclarationKind,
                      dictionary: [String: SourceKitRepresentable]) { }


    func validateFunction(_ file: File, kind: SwiftDeclarationKind,
                           dictionary: [String: SourceKitRepresentable]) { }


    func validateFunction(_ file: File,
                      kind: SwiftDeclarationKind,
                      dictionary: [String: SourceKitRepresentable]) { }
