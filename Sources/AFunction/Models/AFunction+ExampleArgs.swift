import AValue
import Foundation

public extension AFunction {
    struct AValueArrayElement: Hashable, Codable, Sendable, Identifiable {
        public let id: Int
        public let value: AValue
        public let isLast: Bool
    }

    struct ExampleArgs: Codable, Sendable, Hashable, Identifiable {
        public let id: UUID
        public let arguments: [AValue]
        public let arguments2: [AValueArrayElement]

        public init(_ arguments: [AValue]) {
            id = UUID()
            self.arguments = arguments
            var result = [AValueArrayElement]()
            for (index, argument) in arguments.enumerated() {
                if index == arguments.count - 1 {
                    result.append(AValueArrayElement(id: index, value: argument, isLast: true))
                } else {
                    result.append(AValueArrayElement(id: index, value: argument, isLast: false))
                }
            }
            arguments2 = result
        }
    }
}
