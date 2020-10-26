import Foundation

public struct XcodeIssue: Hashable {
    public let type: String // error, warning, note ...
    public let location: SourceLocation?
    public let message: String

    public init(type: String, location: SourceLocation, message: String) {
        self.type = type
        self.location = location
        self.message = message
    }

    /// Parse line to issue.
    ///
    ///     {path}:{line}:{column?}: {type}: {message}
    public static func parse(_ line: String) -> XcodeIssue? {
        let scanner = Scanner(string: line)

        guard let file = scanner.scanUpToString(":"), scanner.scanCharacter() == ":" else {
            return nil
        }
        guard let line = scanner.scanInt(), scanner.scanCharacter() == ":" else {
            return nil
        }
        let column = scanner.scanInt() // missing in test logs
        if column != nil, scanner.scanCharacter() != ":" {
            return nil
        }
        guard let type = scanner.scanUpToString(":"), scanner.scanCharacter() == ":" else {
            return nil
        }
        guard let message = scanner.scanUpToString("\n") else {
            return nil
        }
        let location = SourceLocation(file: file, line: line, column: column)
        return XcodeIssue(type: type, location: location, message: message)
    }
}
