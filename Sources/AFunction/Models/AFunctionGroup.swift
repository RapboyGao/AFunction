import Foundation

public struct AFunctionGroup: Sendable, Identifiable {
    public let id: AFunction.Part
    public let functions: [AFunction]

    public init(id: AFunction.Part, functions: [AFunction]) {
        self.id = id
        self.functions = functions
    }
}

public extension Array where Element == AFunctionGroup {
    init(_ functions: [AFunction]) {
        self = AFunction.Part.allCases.map { part in
            AFunctionGroup(id: part, functions: functions.filter { $0.part == part })
        }
    }
}
