import AValue
import Foundation

public extension AFunction {
    struct ExampleArgs: Codable, Sendable, Hashable, Identifiable {
        public let id: UUID
        public let arguments: [AValue]

        var arguments2: [TheIdentifiable<AValue>] {
            arguments.map { TheIdentifiable($0) }
        }

        public init(_ arguments: [AValue]) {
            self.id = UUID()
            self.arguments = arguments
        }
    }
}
